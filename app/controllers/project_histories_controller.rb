class ProjectHistoriesController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @project_history = @project.project_histories.build
  end

  def create
    @project = Project.find(params[:project_id])
    @project_history = @project.project_histories.build(project_history_params)

    if @project_history.save
      redirect_to @project, notice: 'Project history was successfully created.'
    else
      render :new
    end
  end

  private

  def project_history_params
    params.require(:project_history).permit(:actionable_id, :actionable_type)
  end
end
