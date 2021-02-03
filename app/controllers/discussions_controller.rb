class DiscussionsController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @discussions = Discussion.all.paginate(page: params[:page], per_page: 3)
    end

    def new
        @discussion = Discussion.new
    end

    def create
        @discussion = Discussion.new(discussion_params)

        if @discussion.save
            flash[:notice] = "You Created the Discussion successfully!"
            redirect_to discussion_path(@discussion)
        else
            render "new"
        end
    end

    def show
        @discussion = Discussion.find(params[:id])
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