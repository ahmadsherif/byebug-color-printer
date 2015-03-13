require 'minitest_helper'

class TestFrameLineColorizer < Minitest::Test
  def test_being_registered
    frame_line_colorizer = ByebugColorPrinter::Base.fetch_colorizer('frame.line')

    refute_nil frame_line_colorizer
    assert_kind_of ByebugColorPrinter::Colorizer, frame_line_colorizer
    assert_instance_of ByebugColorPrinter::Colorizers::FrameLineColorizer, frame_line_colorizer
  end

  def test_even_pos_colorization
    colorizer = ByebugColorPrinter::Base.fetch_colorizer('frame.line')
    args      = {
      mark: '',
      pos: '0',
      call: 'RSpec::Core::Runner.run_specs(example_groups#Array)',
      file: 'rspec-core-3.0.0/lib/rspec/core/runner.rb',
      line: '108',
    }
    translated_args = '#0 RSpec::Core::Runner.run_specs(example_groups#Array) at rspec-core-3.0.0/lib/rspec/core/runner.rb:108'
    colorized_line  = colorizer.colorize(args) { |_| translated_args }

    assert_equal colorized_line, "\e[37m#{translated_args}\e[0m"
  end

  def test_odd_pos_colorization
    colorizer = ByebugColorPrinter::Base.fetch_colorizer('frame.line')
    args      = {
      mark: '',
      pos: '1',
      call: 'RSpec::Core::Runner.run_specs(example_groups#Array)',
      file: 'rspec-core-3.0.0/lib/rspec/core/runner.rb',
      line: '108',
    }
    translated_args = '#1 RSpec::Core::Runner.run_specs(example_groups#Array) at rspec-core-3.0.0/lib/rspec/core/runner.rb:108'
    colorized_line  = colorizer.colorize(args) { |_| translated_args }

    assert_equal colorized_line, "\e[32m#{translated_args}\e[0m"
  end
end
