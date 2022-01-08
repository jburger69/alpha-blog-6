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

    def edit
        @article = Article.find(params[:id])
    end

    def create
        @article = Article.new(article_params)
        # byebug
        if @article.valid?
            @article.save
            flash[:notice] = "Article was created successfully."
            redirect_to @article
        else
            render :new
        end
    end

    def update
        @article = Article.find(params[:id])
        @article.update(article_params)
        if @article.valid?
            @article.save
            redirect_to @article
        else
            render :edit
        end
    end


    private

    def article_params
        params.require(:article).permit(:title, :description)
    end
    
end