module Web::Controllers::Weather
  class Search
    include Web::Action

    expose :city
    expose :cities

    params do
      required(:city).schema do
        required(:name).filled(:str?)
      end
    end

    def call(params)

      if params.valid?
        @cities = CityRepository.new.find_by_name(params[:city][:name])
        if cities.count == 1
          redirect_to '/weather/temperature?id='+cities.first.id.to_s
        end
      else
        self.status = 422
      end    	
		end
  end
end