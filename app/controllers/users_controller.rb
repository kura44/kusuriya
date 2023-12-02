class UsersController < ApplicationController
    before_action :user_admin, only: [:index]

    def show
        @user = User.find(params[:id]) 
    end

    def index
        @users = User.all
    end

    def following
        @user  = User.find(params[:id])
        @users = @user.followings
        render 'show_follow'
    end

    def followers
        @user  = User.find(params[:id])
        @users = @user.followers
        render 'show_follower'
    end

    private
    #管理者(admin)権限
    def user_admin
        @users = User.all
        #ログインしているユーザーが管理者ならば
        if  current_user.admin == true
            #indexアクションを実行
            render action: "index"
        #それ以外の場合は
        else
            #トップページへ戻る
            redirect_to root_path
        end
    end
end
