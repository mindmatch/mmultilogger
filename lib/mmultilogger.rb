require 'mmultilogger/version'

class Mmultilogger
  def initialize(*loggers)
    @loggers = loggers.flatten
  end

  def method_missing(method, *args, &block)
    loggers.map do |logger|
      logger.public_send(method, *args, &block)
    end
  end

  attr_reader :loggers
end
