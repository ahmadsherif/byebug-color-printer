module ByebugColorPrinter
  class Colorizer
    CLEAR = "\e[0m"
    GREEN = "\e[32m"
    WHITE = "\e[37m"

    def colorize(args, &block)
      yield args
    end

    private

    # Both #set_color and #lookup_color are copied from thor gem,
    # slightly modified, though
    def set_color(string, *colors)
      if colors.compact.empty?
        string
      elsif colors.all? { |color| color.is_a?(Symbol) }
        ansi_colors = colors.map { |color| lookup_color(color) }
        "#{ansi_colors.join}#{string}#{CLEAR}"
      end
    end

    def lookup_color(color)
      return color unless color.is_a?(Symbol)

      self.class.const_get(color.to_s.upcase)
    end
  end
end

Dir["#{File.dirname(__FILE__)}/colorizers/*.rb"].each { |f| require f }
