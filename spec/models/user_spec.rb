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

    it "郵便番号が8文字以上は登録できない" do
      @user = User.new(postcode: "a" * 8)
      expect(@user.valid?).to eq(false)
    end

    it "郵便番号が6文字以下は登録できない" do
      @user = User.new(postcode: "a" * 6)
      expect(@user.valid?).to eq(false)
    end


    it "住所がなければ無効" do
      @user = User.new(address: nil)
      expect(@user.valid?).to eq(false)
    end

  end

  describe 'アソシエーションのテスト' do
    context 'Servicesモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:services).macro).to eq :has_many
      end
    end


    context "commentsモデルとの関係" do
      it "1:Nとなっている" do
        expect(User.reflect_on_association(:comments).macro).to eq :has_many
      end
    end

    context "likesモデルとの関係" do
      it "1:Nとなっている" do
        expect(User.reflect_on_association(:likes).macro).to eq :has_many
      end
    end

    context "followingsとの関係" do
      it "1:Nとなっている" do
        expect(User.reflect_on_association(:following_relationships).macro).to eq :has_many
      end
    end

    context "followersとの関係" do
      it "1:Nとなっている" do
        expect(User.reflect_on_association(:followers).macro).to eq :has_many
      end
    end

    context "active_notificationsとの関係" do
      it "1:Nとなっている" do
        expect(User.reflect_on_association(:active_notifications).macro).to eq :has_many
      end
    end

  end

end
