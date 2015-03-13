module ByebugColorPrinter
  class Base
    @@colorizers = {}

    def self.register_colorizer(path, colorizer)
      raise ArgumentError.new('colorizer must be an instance of a Colorizer child') unless colorizer.is_a?(Colorizer)

      @@colorizers[path] = colorizer
    end

    def self.fetch_colorizer(path)
      @@colorizers[path]
    end

    def self.apply_colorizer(path, args, &block)
      colorizer = @@colorizers[path]

      return yield args unless colorizer

      colorizer.colorize(args, &block)
    end
  end
end
