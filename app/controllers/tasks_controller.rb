class TasksController < ApplicationController
    before_action :authenticate_user!

    def index
        @task = Task.new
        @project = Project.find(params[:project_id])
        @project_tasks = @project.tasks
        @this_user = Group.find_by(user_id: current_user.id)
        @groups = Group.where(project_id: @project.id)
        @group = @project.groups.find(params[:project_id])
    end

    def create
        project = Project.find(params[:project_id])
        @task = Task.new(task_params)
        @task.project = project

        if @task.save
            flash[:notice] = "added task successfully"

            redirect_to project_tasks_path
        else
            flash[:alert] = "Description is too short"

            redirect_to project_tasks_path
        end
    end

    def edit
        @project = Project.find(params[:project_id])
        @group = @project.groups.find_by(params[:project_id])
        if @group.can_update || @group.is_admin
            @task = Task.find(params[:task_id])
        else
            flash[:alert] = "you don't have update rights"
            redirect_to project_tasks_path
        end
    end

    def update
        @project = Project.find(params[:project_id])
        @task = Task.find(params[:id])

        if @task.update(task_params)
            flash[:notice] = "Updated the task successfully"
            redirect_to project_tasks_path
        end
    end

    def destroy
        @task = Task.find(params[:task_id])
        
        if @task.destroy
            flash[:notice] = "removed the task successfully!"

            redirect_to project_tasks_path
        end
    end

    private

        def task_params
            params.require(:task).permit(:description)
        end
end