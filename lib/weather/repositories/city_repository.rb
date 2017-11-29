class CityRepository < Hanami::Repository

	def count
    cities.count
  end

  def find_by_name(name)
    cities.where(name: name)
  end

end
