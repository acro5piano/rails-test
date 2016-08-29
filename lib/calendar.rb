class Calendar
  include ActionView

  def initialize(year:nil, month: nil)
    @year = year || Date.today.year
    @month = month || Date.today.month
  end
end

module ApplicationHelper
  @@year ||= Date.today.year
  @@month ||= Date.today.month

  def calendar_for(year, month)
    last_day = Date.new(year, month, -1).day
    table = []

    # Set content
    1.upto(last_day) do |day|
      table.push htmlize(day: day, content: yield(day))
    end

    # Fill in blanks
    table = unshift_calendar(table)
    table = push_calendar(table)

    table.join.html_safe
  end

  def unshift_calendar(table)
    first_wday = Date.new(@@year, @@month, 1).wday
    0.upto(first_wday - 1) do |wday|
      table.unshift htmlize(wday: wday)
    end
    table
  end

  def push_calendar(table)
    last_wday = Date.new(@@year, @@month, -1).wday + 1
    last_wday.upto(6) do |wday|
      table.push htmlize(wday: wday)
    end
    table
  end

  def htmlize(day: nil, content:nil, wday: nil)
    wday ||= Date.new(@@year, @@month, day).wday

    table_tag = case wday
    when 0 then '<tr><td class="%s">%s</td>' % [Rails.application.config.calendar_class_sunday, content]
    when 1 then '<td class="%s">%s</td>' % [Rails.application.config.calendar_class_monday, content]
    when 2 then '<td class="%s">%s</td>' % [Rails.application.config.calendar_class_tuesday, content]
    when 3 then '<td class="%s">%s</td>' % [Rails.application.config.calendar_class_wednesday, content]
    when 4 then '<td class="%s">%s</td>' % [Rails.application.config.calendar_class_thursday, content]
    when 5 then '<td class="%s">%s</td>' % [Rails.application.config.calendar_class_friday, content]
    when 6 then '<td class="%s">%s</td></tr>' % [Rails.application.config.calendar_class_saturday, content]
    end
    table_tag.html_safe
  end

  def calendar_header
    wdays = ['sunday', 'monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday']
    header = []
    wdays.each_with_index do |wday, idx|
      header.push '<th class="%s %s">%s</td>' % [Rails.application.config.send("calendar_class_#{wday}"),
                                                 Rails.application.config.calendar_class_header,
                                                 Rails.application.config.calendar_weekdays[idx]]
    end
    ('<tr>%s</tr>' % header.join).html_safe
  end
end
