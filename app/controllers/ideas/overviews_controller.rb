class Ideas::OverviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_idea

  def index
  end

  def create
    @idea.update(idea_params)
    redirect_to idea_billings_path(@idea)
  end

  private

    def set_idea
      @idea ||= Idea.find(params[:idea_id])
    end

    def idea_params
      params.require(:idea).permit(:private_contest)
    end
end
