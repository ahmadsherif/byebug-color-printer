require 'minitest_helper'

class TestBase < Minitest::Test
  def setup
    @path = 'dummy.path'
  end

  def test_registering_valid_colorizer
    colorizer = ByebugColorPrinter::Colorizer.new

    assert_equal ByebugColorPrinter::Base.register_colorizer(@path, colorizer), colorizer
  end

  def test_registering_invalid_colorizer
    assert_raises(ArgumentError) { ByebugColorPrinter::Base.register_colorizer('frame.line', Class.new) }
  end

  def test_fetching_colorizer
    colorizer = ByebugColorPrinter::Colorizer.new

    ByebugColorPrinter::Base.register_colorizer(@path, colorizer)

    assert_equal ByebugColorPrinter::Base.fetch_colorizer(@path), colorizer
  end

  def test_apply_colorizer_with_matching_colorizer
    path            = 'dummy.colorizer'
    dummy_colorizer = Class.new(ByebugColorPrinter::Colorizer) do
      def colorize(args)
        translated_args = yield args

        "##{translated_args}#"
      end
    end.new

    ByebugColorPrinter::Base.register_colorizer(path, dummy_colorizer)

    ret = ByebugColorPrinter::Base.apply_colorizer(path, {}) { |_| 'string' }

    assert_equal ret, '#string#'
  end

  def test_apply_colorizer_with_no_matching_colorizer
    ret = ByebugColorPrinter::Base.apply_colorizer(@path, {}) { |_| 'string' }

    assert_equal ret, 'string'
  end
end
