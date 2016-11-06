module ReservationsHelper
  def calendar_for(year, month)
    c = Calendar.new(year, month)
    c.render do |day|
      yield(day)
    end
  end

  class Calendar
    def initialize(year, month)
      @year = year || Date.today.year
      @month = month || Date.today.month
    end

    def render
      table = []

      # Fill in blanks
      first_wday = Date.new(@year, @month, 1).wday - 1
      first_wday.downto(0) do |wday|
        table.unshift htmlize(wday: wday)
      end

      # Set content
      last_day = Date.new(@year, @month, -1).day
      1.upto(last_day) do |day|
        table.push htmlize(day: day, content: yield(day))
      end

      # Fill in blanks
      last_wday = Date.new(@year, @month, -1).wday + 1
      last_wday.upto(6) do |wday|
        table.push htmlize(wday: wday)
      end

      table.join.html_safe
    end

    def htmlize(day: nil, content: nil, wday: nil)
      wday ||= Date.new(@year, @month, day).wday

      table_tag = case wday
                  when 0 then '<tr><td class="bg-danger">%s</td>' % content
                  when 1 then '<td class="">%s</td>' % content
                  when 2 then '<td class="">%s</td>' % content
                  when 3 then '<td class="">%s</td>' % content
                  when 4 then '<td class="">%s</td>' % content
                  when 5 then '<td class="">%s</td>' % content
                  when 6 then '<td class="bg-info">%s</td></tr>' % content
                  end
      table_tag.html_safe
    end
  end
end
