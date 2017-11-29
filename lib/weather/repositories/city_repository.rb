class CityRepository < Hanami::Repository

	def count
    cities.count
  end

  def find_by_name(city_name)
    cities.where{ name.ilike("%?%", city_name) }
  end

end
