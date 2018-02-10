module HaveDate
  extend ActiveSupport::Concern

  included do
    delegate :t, to: I18n

    class << self
      def has_date
        has_one(:rel_date, class_name: Str::CalDate.name, as: :belong, inverse_of: :belong)

        accepts_nested_attributes_for :rel_date

        delegate :date, to: :belong, prefix: true

        define_method :instance_date do
          @intance_name ||= rel_name || build_rel_name
        end

        define_method :date= do |str|
          instance_name.value = str
        end

        define_method :date do
          instance_name.value
        end
      end

      def by_date(ymd)
        joins(:rel_date).find_by('strs.value' => ymd) || new(date: ymd)
      end
    end #/class << self
  end # /included

  def day
    date.to_date.day
  end

  def wday
    date.to_date.wday
  end

  def wday_name
    t('date.abbr_day_names')[wday]
  end
end