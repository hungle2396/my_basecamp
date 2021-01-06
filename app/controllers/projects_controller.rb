class ProjectsController < ApplicationController
    def index
        @projects = Project.all
    end

    def new
        @project = Project.new
    end

    def create
        @project = Project.new(params.require(:project).permit(:title, :description))
        @project.user = current_user
        if @project.save
            redirect_to project_path(@project)
        else
            render "new"
        end
    end

    def show
        @project = Project.find(params[:id])
        @user = current_user
    end

    def edit
        @project = Project.find(params[:id])
    end

    def update
        @project = Project.find(params[:id])
        if @project.update(params.require(:project).permit(:title, :description))
            redirect_to @project
        else
            render "edit"
        end
    end

    def destroy
        @project = Project.find(params[:id])
        @user = current_user
        @project.destroy
        redirect_to user_path(@user.id)
    end

    private
        def user_params
            params.require(:user).permit(:username, :email)
        end
end