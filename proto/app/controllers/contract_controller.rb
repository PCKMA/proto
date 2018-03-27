class EntryController < ApplicationController
  before_action :sign_in_required, only: [:index]
  def index
  end

  def new
  end
end
