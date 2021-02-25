class StoresController < ApplicationController
  before_action :set_store, only: [:show]
  def show
    @articles = @store.articles.page(params[:page]).per(20)
  end

  private

  def set_store
    @store = Store.find(params[:id])
  end
end