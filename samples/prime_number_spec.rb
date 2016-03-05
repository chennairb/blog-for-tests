## prime_number_spec.rb
require 'rspec'
require File.expand_path('../prime_number.rb', __FILE__)

RSpec.describe 'PrimeNumber' do
  describe 'is_it?' do

    it 'should be true for 5' do
      expect(PrimeNumber.is_it?(5)).to eq(true)
    end

    it 'should be false for 77' do
      expect(PrimeNumber.is_it?(77)).to eq(false)
    end
  end
end
