class IdeasController < ApplicationController
  before_action :authenticate_user!, except: [:new]

  def index
    @ideas = Idea.published.search(category_id: params[:category_id])
    respond_to do |f|
      f.js { render layout: false }
      f.html
    end
  end

  def new
  end

  def create
    idea = Idea.create(owner: current_user, kind: params[:kind], status: STATUS::CREATED)
    redirect_to idea_pricings_path(idea)
  end

end
