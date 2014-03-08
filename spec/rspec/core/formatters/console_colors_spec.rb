require 'spec_helper'
require 'rspec/core/formatters/console_colors'

RSpec.describe "RSpec::Core::Formatters::ConsoleColors" do
  let(:helper) { RSpec::Core::Formatters::ConsoleColors }

  describe "#colorize" do
    it "accepts a VT100 integer code and formats the text with it" do
       expect(helper.colorize('abc', 32)).to eq "\e[32mabc\e[0m"
    end

    it "accepts a symbol as a color parameter and translates it to the correct integer code, then formats the text with it" do
       expect(helper.colorize('abc', :green)).to eq "\e[32mabc\e[0m"
    end

    it "accepts a non-default color symbol as a parameter and translates it to the correct integer code, then formats the text with it" do
       expect(helper.colorize('abc', :cyan)).to eq "\e[36mabc\e[0m"
    end
  end
end
