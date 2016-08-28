module Calendar
  def self.configuration
    @configuration ||= Calendar::Configuration.new
  end

  def self.configure
    yield configuration if block_given?
  end
end
