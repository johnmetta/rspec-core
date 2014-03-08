module RSpec
  module Core
    module Formatters
      module ConsoleCodes
        VT100_CODES =
          {
            :black   => 30,
            :red     => 31,
            :green   => 32,
            :yellow  => 33,
            :blue    => 34,
            :magenta => 35,
            :cyan    => 36,
            :white   => 37,
            :bold    => 1,
          }
        VT100_CODE_VALUES = VT100_CODES.values

        module_function

        def console_code_for(code_or_symbol)
          if VT100_CODE_VALUES.include?(code_or_symbol)
            code_or_symbol
          else
            VT100_CODES.fetch(code_or_symbol) do
              code_for(:white)
            end
          end
        end

        def wrap(text, code_or_symbol)
          if enabled?
            "\e[#{console_code_for(code_or_symbol)}m#{text}\e[0m"
          else
            text
          end
        end

        def enabled?
          RSpec.configuration.color_enabled?
        end

      end
    end
  end
end
