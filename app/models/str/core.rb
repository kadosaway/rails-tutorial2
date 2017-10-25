class Str::Core < Str
  class << self
    def instance
      @instance ||= first || create(value: SecureRandom.uuid)
    end
  end
end
