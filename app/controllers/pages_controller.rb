class PagesController < ApplicationController
  def home
  	if user_signed_in? && @current_user.campaigns.any?
  		redirect_to campaigns_path
  	end
  end
end
