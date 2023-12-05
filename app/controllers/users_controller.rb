class UsersController < ApplicationController
    before_action :user_admin, only: [:index]

    def show
        @user = User.find(params[:id]) 
        @currentUserEntry=Entry.where(user_id: current_user.id)
        @userEntry=Entry.where(user_id: @user.id)
        if @user.id == current_user.id
        else
            @currentUserEntry.each do |cu|
                @userEntry.each do |u|
                    if cu.room_id == u.room_id then
                        @isRoom = true
                        @roomId = cu.room_id
                    end
                end
            end
        end
        if @isRoom
        else
            @room = Room.new
            @entry = Entry.new
        end
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
