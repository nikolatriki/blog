class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
  end

  def create
    article = Article.create(article_params)

    redirect_to article # redirect_to "/articles/#{article.id}"
  end

  private
  
  def article_params
    params.require(:article).permit(:title, :body)
  end
end
