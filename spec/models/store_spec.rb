require 'rails_helper'

RSpec.describe Store, type: :model do
  it '正常ケース' do
    store = Store.create({
      name: "幻想茶房仙台駅前店",
      address: "宮城県仙台市青葉区中央1-2-3",
      place: "何だっけこのカラム",
      nearest_station: "JR仙台駅",
      phone_number: "000-0000-0000"
    })
    store.store_images.build({
      store_id: store.id,
      caption: 'キャプション',
      image_data: Shrine.uploaded_file(
        'id' => SecureRandom.hex(8),
        'storage' => 'cache',
        'metadata' => { 'mime_type' => 'image/jpeg', 'size' => 1.megabyte }).to_json,
        display_order: 1
    })
    expect(store).to be_valid
  end
end
