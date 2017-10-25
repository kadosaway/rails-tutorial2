class TopicsController < ApplicationController
  delegate :order, to: Topic
  
  def index
    instance_variable_set '@' + controller_name, order('updated_at desc')      
  end
  
  def new
    instance_variable_set '@' + controller_name.singularize, Topic.new(topic_params) 
    render 'edit'
  end
  
  def create
    Topic.create!(topic_params)
    flash.notice = :success
    redirect_to action: :index
  rescue => e
    @record = e.record  
  end
  
  def show
    @record = Topic.find_by(id: params[:id])
  end
  
  def edit
    @record = Topic.find_by(id: params[:id])
  end
  
  def update
    @record = Topic.find_by(id: params[:id])
    @record.update!(topic_params)
    flash.notice = :success
    redirect_to action: :index
  rescue => e
    @record = e.record  
  end
  
  private
  
  def topic_params
    params[:topic].try(:permit,[:name, :name_en, :text])
  end
end
