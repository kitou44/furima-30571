require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録/ユーザー情報' do
    context '登録がうまくいくとき' do
      it '' do
        expect(@user).to be_valid 
      end
  
    end

        
    context '登録がうまくいかないとき' do
      
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        binding.pry
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      
      it "emailは、＠がなければ登録できない" do
        @user.email = "kitoulilc.ocn.ne.jp"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid", "Email is invalid")
      end
      
      it "passwordが必須及び6文字以下だと登録できない" do
        @user.password = "88c39"
        @user.password_confirmation = "88c39"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      
      it 'passwordとpassword_confirmationが一致しない場合には登録できない' do
        @user.password = '88c3988c39'
        @user.password_confirmation = 'AAAAA'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "パスワードとパスワード（確認用）、値の一致でなければ登録できない" do
        @user .password_confirmation = "88c39"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "パスワードとパスワード（確認用）は、英数字混合でなければ登録できない" do
        @user .password_confirmation = "88398839"
        @user .password_confirmation = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      
      it "family_nameがで全角（漢字・ひらがな・カタカナ）での入力がなければ登録できない" do
        @user.family_name = 'ｷﾄｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end
      
      it "first_nameが全角（漢字・ひらがな・カタカナ）での入力がなければ登録できない" do
        @user.first_name = 'ｶｽﾞｵ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it "family_nameは、全角（漢字・ひらがな・カタカナ）での入力がなければ登録できない" do
        @user.family_name = "ｷﾄｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end 
      
      it "family_nameのフリガナは、全角（カタカナ）での入力が必須でなければ登録できない" do
        @user.family_name = "ｷﾄｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end
      
      it "生年月日が必須であること" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end