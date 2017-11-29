require_relative '../../../spec_helper'

describe Web::Controllers::Home::Index do
  let(:action) { Web::Controllers::Home::Index.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    
    response[0].must_equal 302
    assert_match '/weather', response[1]['Location']
  end
end
