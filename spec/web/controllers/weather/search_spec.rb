require_relative '../../../spec_helper'

describe Web::Controllers::Weather::Search do
  let(:action) { Web::Controllers::Weather::Search.new }
  let(:params) { Hash[city: { }] }

  describe 'with valid params' do

    describe 'with a unique city' do
      let(:params) { Hash[city: { name: 'Detroit'}] }

      it 'finds a unique city' do
        response = action.call(params)

        response[0].must_equal 302
        assert_match '/weather/temperature?id=', response[1]['Location']

      end
    end  

    describe 'with a duplicate city' do
      let(:params) { Hash[city: { name: 'Portland'}] }
      
      it 'finds a duplicate city' do
        response = action.call(params)
        response[0].must_equal 200
      end
    end

    describe 'with a non-existant city' do
      let(:params) { Hash[city: { name: 'adfadsfasdfasdf'}] }
      
      it 'finds no city' do
        response = action.call(params)
        response[0].must_equal 200
      end
    end
  end

  describe 'with invalid params' do
    let(:params) { Hash[city: { }] }

    it 'returns HTTP client error' do
      response = action.call(params)
      response[0].must_equal 422
    end

    it 'dumps errors in params' do
      action.call(params)
      errors = action.params.errors

      errors.dig(:city, :name).must_equal  ['is missing']
    end
  end
end