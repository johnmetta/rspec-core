require 'spec_helper'
require 'rspec/core/formatters/console_codes'

RSpec.describe "RSpec::Core::Formatters::ConsoleCodes" do
  let(:console_codes) { RSpec::Core::Formatters::ConsoleCodes }

  describe "#wrap" do
    it "accepts a VT100 integer code and formats the text with it" do
       expect(console_codes.wrap('abc', 32)).to eq "\e[32mabc\e[0m"
    end

    it "accepts a symbol as a color parameter and translates it to the correct integer code, then formats the text with it" do
       expect(console_codes.wrap('abc', :green)).to eq "\e[32mabc\e[0m"
    end

    it "accepts a non-default color symbol as a parameter and translates it to the correct integer code, then formats the text with it" do
       expect(console_codes.wrap('abc', :cyan)).to eq "\e[36mabc\e[0m"
    end

    it "accepts :bold formats the text with it" do
       expect(console_codes.wrap('abc', :bold)).to eq "\e[1mabc\e[0m"
    end
  end
end
