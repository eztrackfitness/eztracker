class StaticpagesController < ApplicationController
	
	def home
		if user_signed_in?
			redirect_to dashboard_path(current_user.id)
		end
	end
	
	def product
	end
	
	def app
	end
	
	def about
	end 
	
	def menu
		@uprofile = current_user.userprofile
	end
	
	def analytics
	end
	
	def performance 
	end
	
	def dashboard 
	end
	
	def compare_workouts
	end
		
end
