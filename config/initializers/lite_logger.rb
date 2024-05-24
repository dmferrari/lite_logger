# frozen_string_literal: true

LiteLogger.configure do |config|
  config.level = :debug
  config.format = :json
  config.destination = Rails.root.join('log', 'lite_logger.log')
end
