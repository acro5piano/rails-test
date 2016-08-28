module Calendar
  class Configuration
    def initialize
      @class_sunday ||= 'calendar__sunday'.freeze
      @class_monday ||= 'calendar__monday'.freeze
      @class_tuesday ||= 'calendar__tuesday'.freeze
      @class_wednesday ||= 'calendar__wednesday'.freeze
      @class_thursday ||= 'calendar__thursday'.freeze
      @class_friday ||= 'calendar__friday'.freeze
      @class_saturday ||= 'calendar__saturday'.freeze

      if @use_twitter_bootstrap
        @class_sunday = 'calendar__sunday bg-danger'.freeze
        @class_saturday = 'calendar__saturday bg-info'.freeze
      end
    end

    attributes = [:class_sunday, :class_monday, :class_tuesday, :class_wednesday,
                  :class_thursday, :class_friday, :class_saturday, :class_header,
                  :weekdays, :use_twitter_bootstrap]
    attributes.each do |attr|
      define_method(attr) do
        instance_variable_get "@#{attr}".to_sym
      end

      define_method(attr.to_s + '=') do |value|
        instance_variable_set "@#{attr}".to_sym, value.freeze
      end
    end
  end
end
