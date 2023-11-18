class TemplatesController < ApplicationController
    def index
        @templates = Template.all
    end

    def new
        @template = Template.new
    end
    
    def create
        template = Template.new(template_params)
        if template.save!
            #indexアクションを実行
            redirect_to :action => "index"
        else
            #nemアクションを実行
            redirect_to :action => "new"
        end
    end
    
    def show
        @template = Template.find(params[:id])
    end
    
    def edit
        @template = Template.find(params[:id])
    end
    
    def update
        template = Template.find(params[:id])
        if template.update(template_params)
            redirect_to :action => "show", :id => template.id
        else
            redirect_to :action => "new"
        end
    end
    
    def destroy
        template = Template.find(params[:id])
        template.destroy
        redirect_to action: :index
    end

    private
    def template_params
        params.require(:template).permit(:name, :image, :template_id)
    end
end
