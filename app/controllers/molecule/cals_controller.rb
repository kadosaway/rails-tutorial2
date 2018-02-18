class Molecule::CalsController < ApplicationController


  include DatetimeHelper

  helper_method :instances

  def show
    render 'index'
  end

  def day
    render locals: {
      day: Molecule::Cal.by_date('%d%02d%02d' % [year, month, params[:day]]).tap(&:save)
    }
  end

  def ransack_param
    (params[:q] || {}).reverse_merge(s: 'updated_at desc')
  end



  def instances
    @instances ||= [*1..last_day].map do |day|
      Molecule::Cal.by_date('%d%02d%02d' % [year, month, day])
    end
  end
end
