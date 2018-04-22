class ClaimsController < ApplicationController

  def new
    @products = Product.all
    @claim = Claim.new
  end

  def create
    @claim = Claim.new(claim_params)
    @claim.member_id = current_member.id
#    binding.pry
    if @claim.save
      redirect_to home_index_path, notice: 'submission succeedded'
    else
      flash.now[:alert] = "submission failed"
      render :new
    end
  end

  private
  def claim_params
    params.require(:claim).permit(:claim_datetime_at, :image, :description)
  end

end
