class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @projects = @user.projects
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

        if @user.destroy
            redirect_to root_url, notice: "User deleted."
        end
    end
end
