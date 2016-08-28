module Calendar
  class Configuration
    def initialize
      @class_sunday ||= 'calendar__sunday'
      @class_monday ||= 'calendar__monday'
      @class_tuesday ||= 'calendar__tuesday'
      @class_wednesday ||= 'calendar__wednesday'
      @class_thursday ||= 'calendar__thursday'
      @class_friday ||= 'calendar__friday'
      @class_saturday ||= 'calendar__saturday'

      if @use_twitter_bootstrap
        @class_sunday = 'calendar__sunday bg-danger'
        @class_saturday = 'calendar__saturday bg-info'
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
        instance_variable_set "@#{attr}".to_sym, value
      end
    end
  end
end
