module ApplicationHelper
  # ページごとの完全なタイトルを返す
  def full_title(page_title = '')
    base_title = "予約王"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
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

    def calendar_header
      content = 'w'
      [ '<tr><td class="bg-danger">%s</td>' % t('sunday'),
        '<td class="">%s</td>' % content,
        '<td class="">%s</td>' % content,
        '<td class="">%s</td>' % content,
        '<td class="">%s</td>' % content,
        '<td class="">%s</td>' % content,
        '<td class="bg-info">%s</td></tr>' % content].join.html_safe
    end
  end

end
