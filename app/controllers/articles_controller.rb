class ArticlesController < ApplicationController
  def index
  end

  private
  def article_params
    params.require(:article).permit(:content, :image).merge(user_id: current_user.id)
  end
end
