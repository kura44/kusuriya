class MaomaosController < ApplicationController

    before_action :authenticate_user!, only: [:create]

    def index
        @maomaos = Maomao.all
    end
    def new
        @maomao = Maomao.new
    end
    
    def create
        maomao = Maomao.new(maomao_params)
        if maomao.save!
            redirect_to :action => "index"
        else
            redirect_to :action => "new"
        end
    end
    def show
        @maomao = Maomao.find(params[:id])
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
