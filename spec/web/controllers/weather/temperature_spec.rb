require_relative '../../../spec_helper'

describe Web::Controllers::Weather::Temperature do
  let(:action) { Web::Controllers::Weather::Temperature.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
