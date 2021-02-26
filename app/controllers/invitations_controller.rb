class InvitationsController < ApplicationController
    before_action :authenticate_user!

    def new
        user = current_user
        project = Project.find(params[:project_id])
        group = Group.find_by(user_id: user, project_id: project)

        if group.is_admin === false
            flash[:alert] = "Ah ah ah, you don't have access to that page!"
            redirect_to user_path(current_user)
        end
    end

    def create
        @project = Project.find(params[:project_id])
        user = User.find_by(email: params[:email])
        
        if user.present?
            group = Group.new(user_id: user.id, project_id: @project.id)
            
            if params[:role] == "admin"
                group.is_admin = true
            else
                group.is_admin = false
            end

            group.save

            flash[:notice] = "Added user successfully"
            redirect_to project_path(@project)
        else
            flash[:alert] = "User email address doesn't exist"
            redirect_to project_path(@project)
        end
    end

    def destroy
        project = Project.find(params[:id])
        group = Group.find_by(user_id: params[:user_id],project_id: params[:project_id])

        if group.destroy
            flash[:notice] = "Removed user successfully"  
            redirect_to project_path(project)
        end
    end
end