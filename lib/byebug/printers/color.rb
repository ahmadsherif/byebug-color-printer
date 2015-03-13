require 'byebug/printers/plain'

module Byebug
  module Printers
    class Color < Plain
      def print(path, args = {})
        ByebugColorPrinter::Base.apply_colorizer(path, args) do |processed_args|
          super(path, processed_args)
        end
      end
    end
  end
end
