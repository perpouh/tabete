module Admin
  class StoresController < AdminController
    def new
      @store = Store.new
      3.times { @store.store_images.build }
    end

    def create
      @store = Store.new(stores_params)
      @store.validate!
      @store.save!
    end

    private

    def stores_params
      params.require(:store).permit(
        :name, :prefecture_id, :address, :nearest_station, :phone_number, :commit,
        store_images_attributes: %i[image caption display_order]
      )
    end
  end
end