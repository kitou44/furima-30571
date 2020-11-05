require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録/ユーザー情報' do
    context '登録がうまくいくとき' do
      
      it 'nicknameが必須であること' do
        @user.nickname = 'kitou'
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      
      it 'emailが必須であること' do
        @user.email = 'kitou@lailac.ocn.ne.jp'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      
      it "emailが一意性であること" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      
      it "emailは、＠を含む必要があること" do
        @user.email = "kitou@lilc.ocn.ne.jp"
        expect(@user).to be_valid
      end
      
      it "passwordが必須及び6文字以上での入力が必須であること" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        expect(@user).to be_valid
      end
      
      it 'passwordが確認用を含めて2回入力し、半角英数字混合で入力が必須であること' do
        @user.password = 'a1b23c'
        @user.password_confirmation = 'a1b23c'
        expect(@user).to be_valid
      end

      it "パスワードとパスワード（確認用）、値の一致が必須であること" do
        user = build(:user, password_confirmation: "")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("doesn't match Password")
      end
      
      it "family_nameがで全角（漢字・ひらがな・カタカナ）での入力が必須である" do
        @user.family_name = '木藤'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it "first_nameが全角（漢字・ひらがな・カタカナ）での入力が必須である" do
        @user.first_name = '正臣'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

        it "family_nameは、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
          @user = build(:user, family_name: "亜いウ絵お蚊")
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name can't be blank")
        end 
        
        it "family_nameのフリガナは、全角（カタカナ）での入力が必須であること" do
          @user = build(:user, family_name: "アイウエオカ")
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name can't be blank")
        end
        
        it "生年月日が必須であること" do
          @user.birthday = '2020-02-22'
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
       end
      end

        
          context '登録がうまくいかないとき' do
      
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
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
        expect(@user).to be_valid
      end
      
      it "passwordが必須及び6文字以下だと登録できない" do
        @user.password = "12345"
        @user.password_confirmation = "12345"
        expect(@user).to be_valid
      end
      
      it 'passwordが確認用を含めて2回入力し、半角英数字混合でなければ登録できない' do
        @user.password = 'AAAAA'
        @user.password_confirmation = 'AAAAA'
        expect(@user).to be_valid
      end

      it "パスワードとパスワード（確認用）、値の一致でなければ登録できない" do
        user = build(:user, password_confirmation: "")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("doesn't match Password")
      end
      
      it "family_nameがで全角（漢字・ひらがな・カタカナ）での入力がなければ登録できない" do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      
      it "first_nameが全角（漢字・ひらがな・カタカナ）での入力がなければ登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

        it "family_nameは、全角（漢字・ひらがな・カタカナ）での入力がなければ登録できない" do
          @user = build(:user, family_name: "")
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name can't be blank")
        end 
        
        it "family_nameのフリガナは、全角（カタカナ）での入力が必須でなければ登録できない" do
          @user = build(:user, family_name: "")
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name can't be blank")
        end
        
        it "生年月日が必須であること" do
          @user.birthday = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
       end
     end
   end
  end