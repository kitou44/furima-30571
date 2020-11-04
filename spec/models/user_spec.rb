require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが半角英数字混合で入力ができる' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
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
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
       end 
      it 'passwordに英小文字が含まれない場合無効な状態であること' do
         @user = User.new(password: '1'+'A' * 5, password_confirmation: '1A'+'a' * 3)
         @user.valid?
         expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it 'passwordに英大文字が含まれない場合無効な状態であること' do
         @user = User.new(password: '1'+'a' * 5, password_confirmation: '1A'+'a' * 3)
         @user.valid?
         expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it 'passwordに数字が含まれない場合無効な状態であること' do
         @user = User.new(password: 'A'+'a' * 5, password_confirmation: '1A'+'a' * 3)
         @user.valid?
         expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it "family_nameが空では登録できないこと" do
          @user.family_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name can't be blank")
        end
        it "first_nameが空では登録できないこと" do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end
        it "family_name_kanaが空では登録できないこと" do
          @user.family_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name kana can't be blank")
        end
        it "first_name_kanaが空では登録できないこと" do
          @user.first_name_kana = ''
          @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
        end
        it "family_nameは、全角（漢字・ひらがな・カタカナ）での入力でないと登録できないこと" do
          @user.family_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name can't be blank")
        end 
        it "family_nameのフリガナは、全角（カタカナ）での入力でないと登録できないこと" do
          @user.family_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name can't be blank")
        end
        it "passwordが5文字以下であれば登録できないこと" do
          @user.password = "12345"
          @user.password_confirmation = "12345"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end
        it "passwordとpassword_confirmationが不一致では登録できないこと" do
          @user.password = "123456"
          @user.password_confirmation = "1234567"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
         it "birthdayが空では登録できないこと" do
           @user.birthday = ''
           @user.valid?
           expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end
     end
   end
  end