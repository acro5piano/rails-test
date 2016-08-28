# TODO: Railsを再起動すると設定が消えてしまうので、どうにかすること

Calendar.configure do |config|
  config.class_sunday = 'bg-danger'
  config.class_saturday = 'bg-info'
  config.class_header = 'text-center'
  config.use_twitter_bootstrap = true
  config.weekdays = ['日','月','火','水','木','金','土']
end
