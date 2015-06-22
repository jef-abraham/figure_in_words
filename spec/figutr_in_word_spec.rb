require 'spec_helper'
require_relative '../figure_in_word'

describe "figure_in_word" do
  before(:each) do
    stub_const("USD_TO_INR", 63)
  end
  
  it "should return nothing" do
    expect(usd_to_inr_word('')).to eq('-')
  end

  it "should reply with 567 crore for 90m USD" do
    expect(usd_to_inr_word("90m")).to eq('567 crore')
  end

  it "should reply with 567 crore for 90M USD" do
    expect(usd_to_inr_word("90M")).to eq('567 crore')
  end

  it "should reply with 6300 crore for 1b USD" do
    expect(usd_to_inr_word("1b")).to eq('6300 crore')
  end

  it "should reply with 6300 crore for 1B USD" do
    expect(usd_to_inr_word("1B")).to eq('6300 crore')
  end

  it "should reply with '6 thousand 3 hundrd' for 100 USD" do
    expect(usd_to_inr_word("100")).to eq('6 thousand 3 hundred')
  end

  it "should reply with '63' for 1 USD" do
    expect(usd_to_inr_word("1")).to eq('63')
  end
end

