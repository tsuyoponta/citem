class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_article, only: [:edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update]

  def index
    @articles = Article.includes(:user).order(id: 'DESC')
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path, success: '記事を投稿しました'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to root_path, success: '記事を更新しました'
    else
      render :edit
    end
  end

  def destroy
    if @article.destroy
      redirect_to root_path, warning: '記事を削除しました'
    end
  end

  private

  def article_params
    params.require(:article).permit(:image, :title, :text).merge(user_id: current_user.id)
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def move_to_index
    if current_user.id != @article.user_id
      redirect_to root_path
    end
  end
end
