class DiscussionsController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @project = Project.find(params[:project_id])

        @discussions = @project.discussions.paginate(page: params[:page], per_page: 3)
    end

    def new
        @discussion = Discussion.new
        @project = Project.find(params[:project_id])

    end

    def create
        project = Project.find(params[:project][:id])
        @discussion = Discussion.new(discussion_params)
        @discussion.project = project
        
        if @discussion.save
            flash[:notice] = "Created the Discussion successfully!"
            redirect_to discussion_path(@discussion)
        else
            render "new"
        end
    end

    def show
        @discussion = Discussion.find(params[:id])
        @comment = Comment.new
        @comments = @discussion.comments.order("created_at DESC")
    end

    def edit
        
    end

    def update

    end

    def destroy

    end

    private

    def discussion_params
        params.require(:discussion).permit(:title, :description)
    end
end