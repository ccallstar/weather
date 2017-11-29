require_relative '../../spec_helper'

describe CityRepository do

	let(:repository) { CityRepository.new }

  it 'can find a unique city by name' do
    cities = repository.find_by_name('Detroit')
    assert_equal(cities.count, 1)
    assert_equal(cities.first.name, 'Detroit')
  end

  it 'can find a duplicate city by name' do
    cities = repository.find_by_name('Portland')
    assert_equal(cities.count, 10)
  end
  
  it 'can import cities from json file' do

		skip 'This is a bit of a heavy operation, comment out this line to test.'

		repository.clear

  	# read cities json file and save to database
  	file = File.read(File.dirname(__FILE__)+'/../../../db/migrations/cities.json')
		data_hash = JSON.parse(file)

    data_hash.each do |city|
      repository.create(
				id: city["id"],
        name: city["name"],
        country: city["country"],
        longitude: city["coord"]["lon"],
        latitude: city["coord"]["lat"]
			)
		end
  end

  it 'has exactly all 209579 cities' do
  	assert_equal(repository.count, 209579)
  end

  # place your tests here
end
