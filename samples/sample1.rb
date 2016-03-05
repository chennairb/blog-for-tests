## Addition

def add(a, b)
  a + b
end


## The test
require 'rspec'

RSpec.describe 'add' do

  it 'should give 5 for 2 and 3' do
    c = add(2, 3)
    expect(c).to eq(5)
  end
end


## rspec sample2.rb
