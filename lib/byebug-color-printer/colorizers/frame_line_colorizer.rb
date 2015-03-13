module ByebugColorPrinter
  module Colorizers
    class FrameLineColorizer < Colorizer
      def colorize(args, &block)
        translated_args = yield args

        color = args[:pos].to_i.even? ? :white : :green

        set_color(translated_args, color)
      end
    end
  end

  Base.register_colorizer('frame.line', Colorizers::FrameLineColorizer.new)
end
