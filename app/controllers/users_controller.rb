class UsersController < ApplicationController
    before_action :user_admin, only: [:index]

    def show
        @user = User.find(params[:id]) 
    end

    def index
        @users = User.all
    end

    private
    def user_admin
        @users = User.all
        if  current_user.admin == true
            render action: "index"
        else
            redirect_to root_path
        end
    end
end
