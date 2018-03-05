class HomeController < ApplicationController
  before_action :authenticate_member!, only: :authentication
  def index
  end

  def authentication
  end
end
