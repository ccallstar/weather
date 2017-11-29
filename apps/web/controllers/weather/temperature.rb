module Web::Controllers::Weather
  class Temperature
    include Web::Action

    expose :result

    def call(params)
    	require 'net/http'
			require 'json'
			url = 'https://api.openweathermap.org/data/2.5/weather?id='+params[:id]+'&units=imperial&APPID='+ENV['OPEN_WEATHER_MAP_APPID']
			uri = URI(url)
			response = Net::HTTP.get(uri)
			@result = JSON.parse(response)
    end
  end
end
