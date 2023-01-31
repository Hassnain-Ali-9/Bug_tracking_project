class ProjectsController < ApplicationController

  before_action :set_project, only: [:show, :edit, :update]

  def index
   @project = Project.all
  end

  def show
  end


  def new
   @project = Project.new
  end

 def create
   @project = Project.new(project_params)
   if @project.save
    flash[:success] = "Project was created successfully!"
    redirect_to project_path(@project) 
    else
    render 'new' , status: 308
   end
 end



  def edit
  end

  def update
   if @project.update(project_params)
    flash[:success] = "Project was updated successfully!"
    redirect_to recipe_path(@project) 
    else
    render 'edit' , status: 308
    end
  end


  def destroy
   Project.find(params[:id]).destroy
   flash[:success] = "Project was deleted successfully!"
   redirect_to projects_path
  end


 private

  def set_project
   @project = Project.find(params[:id])
  end

  def project_params
   params.require(:project).permit(:title)
  end
end





