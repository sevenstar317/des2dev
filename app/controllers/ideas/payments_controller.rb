class Ideas::PaymentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_idea

  def index
  end

  def create
    @idea.update(status: STATUS::PUBLISHED)
    redirect_to ideas_path
  end

  private

    def set_idea
      @idea ||= Idea.find(params[:idea_id])
    end

end

