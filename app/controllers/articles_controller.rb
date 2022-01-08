class ArticlesController < ApplicationController

    def show
        @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        # byebug
        if @article.valid?
            @article.save
            redirect_to @article
        else
            redirect_to new_article_path
        end
    end


    private

    def article_params
        params.require(:article).permit(:title, :description)
    end
    
end