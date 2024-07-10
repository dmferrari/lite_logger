# frozen_string_literal: true

module LiteLogger
  class Logger
    LEVELS = { debug: 0, info: 1, warn: 2, error: 3, fatal: 4 }.freeze

    attr_accessor :level, :format, :destination

    def initialize
      @level = :info
      @format = :plain
      @destination = $stdout
    end

    LEVELS.each_key do |level_name|
      define_method(level_name) do |message|
        log(level_name, message)
      end
    end

    private

    def log(level, message)
      return if LEVELS[level] < LEVELS[@level]

      formatted_message = format_message(level, message)
      write_log(formatted_message)
    end

    def format_message(level, message)
      current_time = Time.now
      case @format
      when :json
        { level: level, message: message, timestamp: current_time }.to_json
      else
        "#{current_time} [#{level.upcase}] #{message}"
      end
    end

    def write_log(message)
      case @destination
      when $stdout, $stderr
        @destination.puts message
      else
        File.open(@destination, 'a') { |file| file.puts message }
      end
    end
  end
end
