module Admin
  class UsersController < AdminController
    before_action :set_user, only: [:show, :edit, :update]

    def index
      @users = User.where(search_params).page(params[:page]).per(20)
    end

    def edit; end

    def update
      @user.assign_attributes(update_params)
      @user.validate!

      @user.save
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def search_params
      params.permit(:page)
    end
  end
end