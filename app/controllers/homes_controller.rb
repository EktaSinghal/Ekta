class HomesController < ApplicationController
	def new
		@user=User.new
	end
end