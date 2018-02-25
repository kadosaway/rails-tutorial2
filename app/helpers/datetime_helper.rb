module DatetimeHelper
  delegate :zone, to: Time
  delegate :now, to: :zone

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

  def datetime_disp(t, tag = :span, **options)
    content_tag(tag, distance_of_time_in_words_to_now(t), title: t, **options)
  end

  def params_day
    '%02d' % params[:day]
  end
end
