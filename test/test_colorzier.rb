require 'minitest_helper'

class TestColorizer < Minitest::Test
  def test_reponds_to_colorize
    colorizer = ByebugColorPrinter::Colorizer.new

    assert_respond_to colorizer, :colorize
  end
end
