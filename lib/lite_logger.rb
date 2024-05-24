# frozen_string_literal: true

require_relative 'lite_logger/version'
require_relative 'lite_logger/logger'

module LiteLogger
  class Error < StandardError; end

  class << self
    attr_accessor :logger

    def configure
      yield self.logger ||= LiteLogger::Logger.new
    end
  end
end
