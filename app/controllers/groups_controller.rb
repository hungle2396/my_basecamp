class GroupsController < ApplicationController
    before_action :authenticate_user!

    def destroy
        project = Project.find(params[:project_id])
        group = Group.find_by(user_id: params[:user_id], project_id: params[:project_id])

        if group.destroy
            flash[:notice] = "Removed user successfully"  
            redirect_to project_path(project)
        end
    end
end