class UsersController < ApplicationController
    before_action :authenticate_user!

    def show
        @user = User.find(params[:id])
        @projects = @user.projects
        print @projects

        if @user != current_user && !current_user.admin?
            redirect_to user_path(current_user)
        end
    end

    def index
        @users = User.all
    end

    def makeAdmin
        @user = User.find(params[:id])
        @user.admin = true
        @user.save
        redirect_to(users_url)
    end

    def removeAdmin
        @user = User.find(params[:id])
        @user.admin = false
        @user.save
        redirect_to(users_url)
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy

        if current_user == @user
            user_session = nil
        end
        

        if @user.destroy
            redirect_to root_url, notice: "User deleted."
        end
    end
end
