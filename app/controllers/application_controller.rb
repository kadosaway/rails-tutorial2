class ApplicationController < ActionController::Base
  before_action :authenticate_boss!
  protect_from_forgery with: :exception

  delegate :human_attribute_name, :ransack, :order,:where, :find_by, to: :controller_model

  helper_method :human_attribute_name
  helper_method :records, :instance, :list_columns, :edit_columns, :show_columns

  def top
  end

  def index
  end

  def new
    @instance = controller_model.new(secure_params)
    render 'edit'
  end

  def create
    instance = controller_model.create!(secure_params)
    flash.notice = :success
    redirect_to action: :show, id: instance.id
  rescue => e
    @instance = e.instance
  end

  def show
  end

  def edit
  end

  def update
    instance.update!(secure_params)
    flash.notice = :success
    redirect_to action: :index
  rescue => e
    @instance = e.record
  end

  private

  def authenticate_boss!
    Rails.logger.info __LINE__
    Rails.logger.info "cookies: #{cookies.inspect}"
    super
  end

  def edit_columns
    %i(name explanation)
  end

  def list_columns
    %i(id name explanation updated_at created_at)
  end

  def show_columns
     %i(id) + edit_columns + %i(updated_at created_at)
  end

  def controller_model
    controller_path.classify.constantize
  end

  def secure_model
    controller_path.singularize.gsub('/', '_').to_sym
  end

  def secure_params
    params[secure_model].try(:permit, edit_columns)
  end


  def records
    if params[:topic_id]
      @q = where(belong_id: params[:topic_id]).ransack(ransack_param)
    else
      @q = ransack(ransack_param)
    end
    @records = @q.result.page(params[:p])
  end

  def ransack_param
    (params[:q] || {}).reverse_merge(s: 'updated_at desc')
  end

  def instance
    @instance ||= find_by(id: params[:id])
  end
end
