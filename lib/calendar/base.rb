module Calendar
  class Base
    def initialize(year:nil, month: nil)
      @year = year || Date.today.year
      @month = month || Date.today.month
    end

    def header
      wdays = ['sunday', 'monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday']
      header = []
      wdays.each_with_index do |wday, idx|
        header.push '<th class="%s">%s</td>' % [Calendar.configuration.send("class_#{wday}"), Calendar.configuration.weekdays[idx]]
      end

      '<tr>%s</tr>' % header.join
    end

    def table()
      last_day = Date.new(@year, @month, -1).day
      table = []

      # Set content
      1.upto(last_day) do |day|
        content = yield(day)
        table.push htmlize(day: day, content: content)
      end

      # Fill in blanks
      table = unshift_calendar(table)
      table = push_calendar(table)

      table.join
    end


    def unshift_calendar(table)
      first_wday = Date.new(@year, @month, 1).wday
      0.upto(first_wday - 1) do |wday|
        table.unshift htmlize(wday: wday)
      end
      table
    end

    def push_calendar(table)
      last_wday = Date.new(@year, @month, -1).wday + 1
      last_wday.upto(6) do |wday|
        table.push htmlize(wday: wday)
      end
      table
    end

    def htmlize(day: nil, wday: nil, content: '')
      wday ||= Date.new(@year, @month, day).wday

      case wday
      when 0 then '<tr><td class="%s">%s</td>' % [Calendar.configuration.class_sunday, content]
      when 1 then '<td class="%s">%s</td>' % [Calendar.configuration.class_monday, content]
      when 2 then '<td class="%s">%s</td>' % [Calendar.configuration.class_tuesday, content]
      when 3 then '<td class="%s">%s</td>' % [Calendar.configuration.class_wednesday, content]
      when 4 then '<td class="%s">%s</td>' % [Calendar.configuration.class_thursday, content]
      when 5 then '<td class="%s">%s</td>' % [Calendar.configuration.class_friday, content]
      when 6 then '<td class="%s">%s</td></tr>' % [Calendar.configuration.class_saturday, content]
      end
    end
  end
end
