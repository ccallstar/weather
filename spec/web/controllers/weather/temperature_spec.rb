require_relative '../../../spec_helper'

describe Web::Controllers::Weather::Temperature do
  let(:action) { Web::Controllers::Weather::Temperature.new }

  describe 'with a valid id' do 
  	let(:params) { Hash[id: '4990729'] }
	  it 'is successful' do
	    response = action.call(params)
	    assert_equal(action.result["cod"], 200)
	  end
	end	

	describe 'without a valid id' do 
		let(:params) { Hash[id: 'asdfasdf'] }
	  it 'is not successful' do
	  	response = action.call(params)
	    assert_equal(action.result["cod"], "400")
	  end
	end	

end
