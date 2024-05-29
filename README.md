# LiteLogger

LiteLogger is a lightweight logging solution for Ruby applications, providing customizable log levels, formats, and destinations.

## Status

[![Gem Version](https://badge.fury.io/rb/lite_logger.svg)](https://badge.fury.io/rb/lite_logger)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lite_logger'
```

And then run:

```bash
bundle install
```

Or install it manually with:

```bash
gem install lite_logger
```

## Usage

### Example

In a Ruby class:

```ruby
# Require the gem
require 'lite_logger'

class MyClass
  def initialize
    # Initialize the logger
    @logger = LiteLogger.new
  end

  def run
    @logger.debug('This is a debug message')
    @logger.info('This is an info message')
    @logger.warn('This is a warning message')
    @logger.error('This is an error message')
    @logger.fatal('This is a fatal message')

    # Method logic here
  end
end
```

## Contributing

Bug reports and pull requests are welcome: <https://github.com/dmferrari/lite_logger/pulls>.

## License

License
This little gem is available as open-source under the terms of the MIT License (see the LICENSE file in the project root for details).
