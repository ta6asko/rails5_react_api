class HomeController < ApplicationController

  def index
    render :layout => false, :file => "public/index.html"
  end
end
