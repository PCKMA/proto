class HomeController < ApplicationController
  before_action :sign_in_required, only: [:index]
  def index
    @inscontracts = Inscontract.includes(:member)
    @claims = Claim.includes(:member)
  end

  def authentication
  end
end
