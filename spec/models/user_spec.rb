require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーションテスト' do
    it '名前がなければ無効' do
      @user = User.new(name: nil)
      expect(@user.valid?).to eq(false)
    end

    it "メールアドレスがなければ無効" do
      @user = User.new(email: nil)
      expect(@user.valid?).to eq(false)
    end

    it "電話番号がなければ無効" do
      @user = User.new(phonenumber: nil)
      expect(@user.valid?).to eq(false)
    end

    it "郵便番号がなければ無効" do
      @user = User.new(postcode: nil)
      expect(@user.valid?).to eq(false)
    end

    it "住所がなければ無効" do
      @user = User.new(address: nil)
      expect(@user.valid?).to eq(false)
    end

    

  end

end
