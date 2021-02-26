module Admin
  class StoresController < AdminController
    def new
      @store = Store.new
    end

    def create
      @store = Store.new(stores_params)
      @store.validate!
      @store.save!
    end

    private

    def stores_params
      params.require(:store).permit(:name, :prefecture_id, :address, :nearest_station, :phone_number, :commit)
    end
  end
end