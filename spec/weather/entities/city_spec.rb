require_relative '../../spec_helper'

describe City do
  # place your tests here
  it 'can be initialized with attributes' do
    city = City.new(name: 'Detroit')

    city.name.must_equal 'Detroit'
  end

  it 'can be initialized from json file' do
  	file = File.read(File.dirname(__FILE__)+'/../../../db/migrations/cities.json')
		data_hash = JSON.parse(file)

		city = City.new(
			id: data_hash[0]["id"],
			name: data_hash[0]["name"],
			country: data_hash[0]["country"],
			longitude: data_hash[0]["coord"]["lon"],
			latitude: data_hash[0]["coord"]["lat"]
		)

		city.name.must_equal data_hash[0]["name"]
	end
end