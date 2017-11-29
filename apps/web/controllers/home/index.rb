module Web::Controllers::Home
  class Index
    include Web::Action

    def call(params)
    	redirect_to "/weather"
    end
  end
end
