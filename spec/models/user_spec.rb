require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  describe 'バリデーションのテスト' do
    let(:user) { build(:user) }
    subject { test_user.valid? }
    context 'name' do
      let(:test_user) { user }
      it '空欄でないこと' do
        test_user.name = ''
        is_expected.to eq false;
      end
    end
end

end
