require 'spec_helper'

RSpec.describe Hello do
  it 'expect return Hello world!' do
    expect(Hello.new.message).to eq 'Hello world!'
  end
end
