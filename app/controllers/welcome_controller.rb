class WelcomeController < ApplicationController # a controller for welcome page which remains open until user signs in
  def index
  end
  def contact
    render :layout => false
  end
  def about
    render :layout => false
  end	
end
