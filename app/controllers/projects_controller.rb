class ProjectsController < ApplicationController
    before_action :authenticate_user!

    def index
        @projects = Project.all.paginate(page: params[:page], per_page: 3)
    end

    def new
        @project = Project.new
    end

    def create
        @project = Project.new(project_params)
        @project.users.push(current_user)
        if @project.save
            @group = Group.find_by(user_id: current_user.id, project_id: @project.id)
            @group.is_admin = true
            @group.save
            ## @project.images.attach(params[:project][:uploads])
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
        
        if @project.update(project_params)
            redirect_to @project
        else
            render "edit"
        end
    end

    def add_upload
        @project = Project.find(params[:id])
        print params
        @project.uploads.attach(params[:project][:uploads])
        @project.save()
        redirect_to @project
    end

    def destroy
        @project = Project.find(params[:id])
        @user = current_user
        @project.destroy
        redirect_to user_path(@user.id)
    end

    private
        def project_params
            params.require(:project).permit(:title, :description, uploads: [])
        end
end