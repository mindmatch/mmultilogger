require "test_helper"
require 'logger'

class MmultiloggerTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Mmultilogger::VERSION
  end

  def test_it_delegates_do_single_logger
    assert_output(/Hallo/) do
      logger = Logger.new($stdout)
      ::Mmultilogger.new(logger).error("Hallo")
    end
  end

  def test_it_delegates_do_multiple_loggers
    assert_output(/Hallo/) do
      logger = Logger.new($stdout)
      ::Mmultilogger.new(Logger.new(nil), logger).error("Hallo")
    end
  end

  def test_it_accepts_a_list_of_loggers
    assert_output(/Hallo/) do
      logger = Logger.new($stdout)
      ::Mmultilogger.new([logger]).error("Hallo")
    end
  end
end
