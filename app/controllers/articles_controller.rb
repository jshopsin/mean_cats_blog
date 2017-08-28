class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
    @category = Category.find(params[:category_id])
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    @article.category = Category.find(params[:category_id])
    if @article.save
      redirect_to @article
    else
      redirect_to "articles#new"
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      redirect_to "articles#update"
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to root_url, notice: "The article has been deleted!"
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :user_id, :category_id)
  end
end