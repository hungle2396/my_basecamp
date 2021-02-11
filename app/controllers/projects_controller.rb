class ProjectsController < ApplicationController
    before_action :authenticate_user!

    def index
        if !current_user.admin?
            flash[:alert] = "You don't access to this page"
            redirect_to user_path(current_user)
        end
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

    def destroy
        @project = Project.find(params[:id])
        @user = current_user
        @project.destroy
        redirect_to user_path(@user.id)
    end

    def add_upload
        @project = Project.find(params[:id])
        print params
        @project.uploads.attach(params[:project][:uploads])
        @project.save()
        redirect_to @project
    end

    def destroy_upload
        @project = Project.find(params[:id])
        upload = ActiveStorage::Attachment.find(params[:upload_id])
        upload.purge
        redirect_to @project
    end

    def add_user
        @project = Project.find(params[:id])
        user = User.find_by(email: params[:email])
        
        if user.present?
            @project.users.push(user)
            @project.save
            flash[:notice] = "Added user successfully"
            redirect_to project_path(@project)
        else
            flash[:alert] = "User email address doesn't exist"
            redirect_to project_path(@project)
        end
    end

    private
        def project_params
            params.require(:project).permit(:title, :description, users: [], uploads: [])
        end
end