require 'byebug'
require 'byebug/printers/color'
require 'byebug-color-printer/base'
require 'byebug-color-printer/colorizer'

Byebug.printer = Byebug::Printers::Color.new
