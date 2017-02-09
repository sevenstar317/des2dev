class Ideas::BriefsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_idea

  def index
  end

  def create
    @idea.update(idea_params)
    @idea.calculate_prices
    redirect_to idea_overviews_path(@idea)
  end

  private

    def set_idea
      @idea ||= Idea.find(params[:idea_id])
    end

    def idea_params
      params.require(:idea).permit(:name, :description, :designer_participation, :deadline, :references, :flow,
        ideas_devices_attributes: [:id, :note, :device_id, :_destroy],
        images_attributes: [:file, :id, :imageable_id, :imageable_type],
        category_ids: []).merge(images_attributes)
    end

end
