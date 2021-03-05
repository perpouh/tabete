module Admin
  class StoresController < AdminController
    before_action :set_store, only: [:edit, :update, :destroy]
    def index
      @stores = Store.where(search_params).page(params[:page]).per(20)
    end

    def new
      @store = Store.new
      3.times { @store.store_images.build }
    end

    def create
      @store = Store.new(stores_params)
      @store.validate!
      @store.save!
    end

    def edit; end

    def update
      @store.assign_attributes(stores_params)
      @store.validate!

      @store.save!
    end

    private

    def set_store
      @store = Store.find(params[:id])
    end

    def search_params
      params.permit(:page)
    end

    def stores_params
      params.require(:store).permit(
        :name, :prefecture_id, :address, :nearest_station, :phone_number, :commit,
        store_images_attributes: %i[image caption display_order]
      )
    end
  end
end