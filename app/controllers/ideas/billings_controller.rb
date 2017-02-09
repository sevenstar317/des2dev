class Ideas::BillingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_idea

  def index
  end

  def create
    current_user.update(user_params)
    redirect_to idea_payments_path(@idea)
  end

  private

    def set_idea
      @idea ||= Idea.find(params[:idea_id])
    end

    def user_params
      params.require(:user).permit(:name, :company, :country_code, :state, :city, :address, :address_2, :zip_code,
                                   :phone, :billing_email)
    end

end
