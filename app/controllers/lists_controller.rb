class ListsController < ApplicationController

  def show
    @list = List.find(params[:id])
  end

  def create
    @list = List.new(list_params)
    @list.validate!
    @list.save
  end

  def update
    @list = List.ours(current_user).find(params[:id])
    @list.assign_attributes(list_params)
    @list.validate!
    @list.save
  end

  private

  def list_params
    params.require(:list).permit(:title)
  end
end
