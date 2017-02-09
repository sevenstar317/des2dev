class Ideas::PricingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_idea

  def index
  end

  def create
    @idea.update(idea_params)
    @idea.calculate_prices
    redirect_to idea_briefs_path(@idea)
  end

  private

    def set_idea
      @idea ||= Idea.find(params[:idea_id])
    end

    def idea_params
      params.require(:idea).permit(prices_attributes: [:id, :active, :quantity])
    end

end


