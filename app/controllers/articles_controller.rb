class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @articles = Article.includes(:user).order(id: 'DESC')
  end

  def new
    @article = Article.new
  end

  def create
    article = Article.new(article_params)
    if article.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def article_params
    params.permit(:image, :title, :text).merge(user_id: current_user.id)
  end
end
