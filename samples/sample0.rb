## Tautology

require 'rspec'

RSpec.describe 'the truth' do

  it 'should be true' do
    expect(true).to eq(true)
  end

  it 'should not be false' do
    expect(true).to_not eq(false)
  end
end
