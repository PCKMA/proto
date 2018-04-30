class ClaimsController < ApplicationController

  def new
    @products = Product.all
    @claim = Claim.new
  end

  def create
    @claim = Claim.new(claim_params)
    @claim.member_id = current_member.id
    if @claim.save
      ClaimMailer.claim_accepted(current_member).deliver_now
      redirect_to home_index_path, notice: 'submission succeedded'
    else
      flash.now[:alert] = "submission failed"
      render :new
    end
  end

  private
  def claim_params
    params.require(:claim).permit(:product_id, :claim_datetime_at, :state, :image, :description, :claim_amount)
  end

end
