class GroupsController < ApplicationController
    before_action :authenticate_user!

    def create
        user = User.find_by(email: params[:email])
        @project = Project.find(params[:project_id])
        
        group = Group.new(user_id: user.id, project_id: @project.id)
        @permitions = params[:permitions]
        if @permitions != nil
            if @permitions.include? "write"
                group.can_write = true
            end
            if @permitions.include? "read"
                group.can_read = true
            end
            if @permitions.include? "update"
                group.can_update = true
            end
            if @permitions.include? "delete"
                group.can_delete = true
            end
        end
        if params[:role] == "admin"
            group.is_admin = true
        else
            group.is_admin = false
        end
        group.save
    end

    def destroy
        project = Project.find(params[:project_id])
        group = Group.find_by(user_id: params[:user_id], project_id: params[:project_id])

        if group.destroy
            flash[:notice] = "Removed user successfully"  
            redirect_to project_path(project)
        end
    end
end