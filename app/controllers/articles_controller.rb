class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]

  def show; end

  private

  def set_article
    @article = Article.find(params[:id])
  end
end