class InscontractsController < ApplicationController
  before_action :sign_in_required

  def new
    @products = Product.all
  end

  def create
    @inscontract = Inscontract.new(inscontract_params)
    @inscontract.member_id = current_member.id
    @inscontract.premium = Product.find(@inscontract.product_id).premium
    if @inscontract.save
      redirect_to inscontract_path(@inscontract.id), notice: 'contract submitted'
    else
      flash.now[:alert] = "contract submission failed"
      render :new
    end
  end

  def show
  end


  private
  def inscontract_params
    params.require(:inscontract).permit(:member_id, :inception_datetime_at, :expiry_datetime_at, :product_id)
  end

end
