class ProjectsController < ApplicationController
    before_action :authenticate_user!

    def index
        @projects = Project.all
    end

    def new
        @project = Project.new
    end

    def create
        @project = Project.new(params.require(:project).permit(:title, :description))
        @project.users.push(current_user)
        if @project.save
            @group = Group.find_by(user_id: current_user.id, project_id: @project.id)
            @group.is_admin = true
            @group.save
            redirect_to project_path(@project)
        else
            render "new"
        end
    end

    def show
        @project = Project.find(params[:id])
        @user = current_user
        @find_user = @project.users.find_by(id: current_user.id)
        unless @find_user.present?
            redirect_to user_path(current_user)
        end
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
        #@project.groups.delete_all
        @project.destroy
        redirect_to user_path(@user.id)
    end

    private
        def user_params
            params.require(:user).permit(:username, :email)
        end
end