class HomeController < ApplicationController
  before_action :authenticate_user!
	def index
		
		redirect_to causas_url
  end
end
