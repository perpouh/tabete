require 'rails_helper'

RSpec.describe User, type: :model do
  it "メール、パスワードがある場合、有効である" do
    user = User.new(
      email: "testman@example.com",
      password: "password",
      )
    expect(user).to be_valid
  end
  it "画像テスト" do
    user = User.new(
      email: "testman@example.com",
      password: "password",
      image_data: Shrine.uploaded_file(
        'id' => SecureRandom.hex(8),
        'storage' => 'cache',
        'metadata' => { 'mime_type' => 'image/jpeg', 'size' => 1.megabyte }
      ).to_json,
    )
    expect(user).to be_valid
  end

  it "メールアドレスが既存レコードと一致する場合、無効である" do
    User.create(
      email: "testman@example.com",
      password: "password",
      )
    user = User.new(
      email: "testman@example.com",
      password: "password",
      )
    expect(user).to be_invalid
  end

  it "ユーザー名が既存レコードと一致する場合、無効である" do
    User.create(
      email: "testman@example.com",
      password: "password",
      name: "hogetaro"
      )
    user = User.new(
      email: "testman2@example.com",
      password: "password",
      name: "hogetaro"
      )
    expect(user).to be_invalid
  end

  it "ユーザー名が禁止ワードである場合、無効である" do
    user = User.new(
      email: "testman2@example.com",
      password: "password",
      name: "system"
      )
    expect(user).to be_invalid
  end

  it "メールアドレスが無い場合、無効である" do
    user = User.new(
      password: "password",
      name: "hogetaro"
      )
    expect(user).to be_invalid
  end

  it "パスワードがない場合、無効である" do
    user = User.new(
      email: "testman2@example.com",
      name: "hogetaro"
      )
    expect(user).to be_invalid
  end
end
