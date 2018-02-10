module DatetimeHelper
  def datetime_disp(t, tag = :span, **options)
    content_tag(tag, distance_of_time_in_words_to_now(t), title: t, **options)
  end
end
