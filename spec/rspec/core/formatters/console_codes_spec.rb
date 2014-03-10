require 'spec_helper'
require 'rspec/core/formatters/console_codes'

RSpec.describe "RSpec::Core::Formatters::ConsoleCodes" do
  let(:console_codes) { RSpec::Core::Formatters::ConsoleCodes }

  before do
    allow(RSpec.configuration).to receive(:color_enabled?) { true }
  end

  describe "#wrap" do
    context "when given a VT100 integer code" do
      it "formats the text with it" do
         expect(console_codes.wrap('abc', 32)).to eq "\e[32mabc\e[0m"
      end
    end

    context "when given a symbolic color name" do
      it "translates it to the correct integer code and formats the text with it" do
         expect(console_codes.wrap('abc', :green)).to eq "\e[32mabc\e[0m"
      end
    end

    context "when given :bold" do
      it "formats the text as bold" do
         expect(console_codes.wrap('abc', :bold)).to eq "\e[1mabc\e[0m"
      end
    end
  end
end
