module RSpec
  module Core
    module Formatters
      module ConsoleColors
        VT100_COLORS =
          {
            :black   => 30,
            :red     => 31,
            :green   => 32,
            :yellow  => 33,
            :blue    => 34,
            :magenta => 35,
            :cyan    => 36,
            :white   => 37
          }
        VT100_COLOR_CODES = VT100_COLORS.values

        module_function

        def color_code_for(code_or_symbol)
          if VT100_COLOR_CODES.include?(code_or_symbol)
            code_or_symbol
          else
            VT100_COLORS.fetch(code_or_symbol) do
              color_code_for(:white)
            end
          end
        end

        def colorize(text, code_or_symbol)
          "\e[#{color_code_for(code_or_symbol)}m#{text}\e[0m"
        end

      end
    end
  end
end
