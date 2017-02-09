class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:edit, :update]
  before_action :current_step, only: [:edit, :update]

  def index
    @projects = Project.published
  end

  def create
    project = Project.create(owner: current_user, status: STATUS::CREATED)
    redirect_to edit_project_path(project, step: 1)
  end

  def edit
  end

  def update
    @project.update(project_params)
    @project.update(status: STATUS::PUBLISHED) if @current_step == 4
    redirect_to next_step_path
  end

  private

    def set_project
      @project ||= Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :description, :funding, :reward, :our_story, :our_team,
        images_attributes: [:file, :id, :imageable_id, :imageable_type],
        category_ids: []).merge(images_attributes)
    end

    def current_step
      @current_step = params[:step].present? ? params[:step].to_i : 1
    end

    def next_step_path
      if @current_step == 4
        projects_path
      else
        edit_project_path(@project, step: @current_step + 1)
      end
    end

end
