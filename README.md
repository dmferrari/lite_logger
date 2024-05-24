# LiteLogger

LiteLogger is a lightweight logging solution for Ruby on Rails applications. It provides customizable log levels, formats, and destinations.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lite_logger'
```

And then execute:

```bash
bundle install
```

Or install it yourself as:

```bash
gem install lite_logger
```

## Usage

### Configuration

You can configure LiteLogger in an initializer file. For example, create a file named `config/initializers/lite_logger.rb` with the following content:

```ruby
# config/initializers/lite_logger.rb
LiteLogger.configure do |config|
  config.level = :debug
  config.format = :json
  config.destination = Rails.root.join('log', 'lite_logger.log')
end
```

### Logging

Use the `LiteLogger` module to log messages in your application:

```ruby
LiteLogger.debug('This is a debug message')
LiteLogger.info('This is an info message')
LiteLogger.warn('This is a warning message')
LiteLogger.error('This is an error message')
LiteLogger.fatal('This is a fatal message')
```

## Contributing

Bug reports and pull requests are welcome on GitHub at <https://github.com/dmferrari/lite_logger>.

## License

License
This gem is available as open-source under the terms of the MIT License (see the LICENSE file in the project root for details).
