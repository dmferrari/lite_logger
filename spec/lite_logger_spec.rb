# frozen_string_literal: true

require 'spec_helper'
require 'json'

RSpec.describe LiteLogger::Logger do # rubocop:disable Metrics/BlockLength
  let(:logger) { described_class.new }

  describe '#initialize' do
    it 'sets the default level to :info' do
      expect(logger.level).to eq(:info)
    end

    it 'sets the default format to :plain' do
      expect(logger.format).to eq(:plain)
    end

    it 'sets the default destination to $stdout' do
      expect(logger.destination).to eq($stdout)
    end
  end

  describe '#level=' do
    it 'sets the log level' do
      logger.level = :debug
      expect(logger.level).to eq(:debug)
    end
  end

  describe '#format=' do
    it 'sets the log format' do
      logger.format = :json
      expect(logger.format).to eq(:json)
    end
  end

  describe '#destination=' do
    it 'sets the log destination' do
      logger.destination = 'log/test.log'
      expect(logger.destination).to eq('log/test.log')
    end
  end

  describe 'logging methods' do
    before do
      logger.level = :debug
      logger.format = :plain
      @log_output = StringIO.new
      logger.destination = @log_output
    end

    LiteLogger::Logger::LEVELS.each_key do |level|
      it "logs #{level} messages" do
        logger.send(level, 'message')
        @log_output.rewind
        expect(@log_output.string).to include("[#{level.to_s.upcase}] message")
      end
    end
  end

  describe '#log' do
    before do
      logger.level = :info
      @log_output = StringIO.new
      logger.destination = @log_output
    end

    it 'does not log messages below the current level' do
      logger.debug('This is a debug message')
      @log_output.rewind
      expect(@log_output.string).to be_empty
    end

    it 'logs messages at or above the current level' do
      logger.info('This is an info message')
      @log_output.rewind
      expect(@log_output.string).to include('[INFO] This is an info message')
    end
  end

  describe '#format_message' do
    before do
      logger.level = :info
      logger.destination = StringIO.new
    end

    context 'when format is :plain' do
      it 'formats the message in plain text' do
        formatted_message = logger.send(:format_message, :info, 'plain message')
        expect(formatted_message).to match(/\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2} [-+]\d{4} \[INFO\] plain message/)
      end
    end

    context 'when format is :json' do
      it 'formats the message as JSON' do
        logger.format = :json
        formatted_message = logger.send(:format_message, :info, 'json message')
        json = JSON.parse(formatted_message)
        expect(json['level']).to eq('info')
        expect(json['message']).to eq('json message')
        expect(json).to have_key('timestamp')
      end
    end
  end

  describe '#write_log' do
    before do
      logger.level = :info
      @log_output = StringIO.new
      logger.destination = @log_output
    end

    it 'writes the message to the destination' do
      logger.send(:write_log, 'Test log message')
      @log_output.rewind
      expect(@log_output.string).to eq("Test log message\n")
    end

    context 'when destination is a file' do
      it 'appends the message to the file' do
        file_path = 'log/test.log'
        logger.destination = file_path
        logger.send(:write_log, 'File log message')
        expect(File.read(file_path)).to include('File log message')
        File.delete(file_path)
      end
    end
  end
end
