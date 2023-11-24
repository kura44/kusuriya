class MaomaosController < ApplicationController

    before_action :authenticate_user!, only: [:create]
    
    def index
        @maomaos = Maomao.all
        #1ページあたりの表示する投稿の数
        @maomaos = @maomaos.page(params[:page]).per(5)
    end
    
    def new
        @maomao = Maomao.new
        #Templateテーブル情報を持ってくる
        @item1 = Template.where(template_id: "hair")
        @item2 = Template.where(template_id: "tops")
        @item3 = Template.where(template_id: "bottoms")
        @item4 = Template.where(template_id: "shoes")
        @item5 = Template.where(template_id: "acce")
    end
    
    def create
        maomao = Maomao.new(maomao_params)
        #ログインしている時
        maomao.user_id = current_user.id
        if maomao.save!
            #indexアクションを実行
            redirect_to :action => "index"
        else
            #nemアクションを実行
            redirect_to :action => "new"
        end
    end
    
    def show
        @maomao = Maomao.find(params[:id])
        @item1 = Template.find_by(name: @maomao.itemid1)
        @item2 = Template.find_by(name: @maomao.itemid2)
        @item3 = Template.find_by(name: @maomao.itemid3)
        @item4 = Template.find_by(name: @maomao.itemid4)
        @item5 = Template.find_by(name: @maomao.itemid5)
    end
    
    def edit
        @maomao = Maomao.find(params[:id])
    end
    
    def update
        maomao = Maomao.find(params[:id])
        if maomao.update(maomao_params)
            redirect_to :action => "show", :id => maomao.id
        else
            redirect_to :action => "new"
        end
    end
    
    def destroy
        maomao = Maomao.find(params[:id])
        maomao.destroy
        redirect_to action: :index
    end

    private
    def maomao_params
        params.require(:maomao).permit(:userid, :postid, :itemid1, :color1, :itemid2, :color2, :itemid3, :color3, :itemid4, :color4, :itemid5, :color5)
    end

end
