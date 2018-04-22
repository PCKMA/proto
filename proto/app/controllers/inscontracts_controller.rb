class InscontractsController < ApplicationController
  before_action :sign_in_required

  def new
    @products = Product.all
  end

  def create
    @inscontract = Inscontract.new(inscontract_params)
    @inscontract.member_id = current_member.id
    if @inscontract.save
      redirect_to home_index_path, notice: 'contract submitted'
    else
      flash.now[:alert] = "contract submission failed"
      render :new
    end
  end

  private
  def inscontract_params
    params.require(:inscontract).permit(:member_id, :inception_datetime_at, :expiry_datetime_at, :product_id)
  end

end
