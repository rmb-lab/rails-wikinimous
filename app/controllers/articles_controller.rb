class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  # CREATE
  ## GET the form
  def new
    @article = Article.new
  end

  ## POST the form
  def create
    @article = Article.create(article_params)
    @article.save
    # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to articles_path
  end

  # UPDATE
  ## GET the form
  def edit
    @article = Article.find(params[:id])
  end

  ## POST the form
  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to articles_path
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

private

  # STRONG PARAMS
  def article_params
    params.require(:article).permit(:title, :content)
  end
end
