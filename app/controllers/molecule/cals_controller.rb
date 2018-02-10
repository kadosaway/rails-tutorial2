class Molecule::CalsController < ApplicationController

  delegate :zone, to: Time
  delegate :now, to: :zone

  helper_method :last_day, :year, :month, :now, :ym, :instances

  def show

    render 'index'
  end

  def day

  end

  def ransack_param
    (params[:q] || {}).reverse_merge(s: 'updated_at desc')
  end

  def last_day
    @last_day ||= Time.new(year, month).end_of_month.day
  end

  def ym
    @ym ||= params[:id] || now.to_s(:Ym)
  end

  def year
    @year ||= ym[0..3]
  end

  def month
    @month ||= ym[4..6]
  end

  def instances
    @instances ||= [*1..last_day].map do |day|
      Molecule::Cal.by_date('%d%02d%02d' % [year, month, day])
    end
  end
end