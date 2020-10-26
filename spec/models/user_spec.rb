require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザーの新規登録' do
    context '新規登録がうまくいく時' do
      it 'nicknameとemail、passwordとpassword_confirmation、first_nameとfirst_name_kana、last_nameとlast_name_kana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上で、英数字混合、確認用も含め入力し、それぞれ値が一致していれば登録できる' do
        @user.password = '1111aaaa'
        @user.password_confirmation = '1111aaaa'
        expect(@user).to be_valid
      end

      it 'ユーザー本名の名字と名前それぞれに、漢字、平仮名、カタカナが使用されていれば登録できる' do
        @user.first_name = '佐藤'
        @user.last_name = 'ひかる'
        expect(@user).to be_valid
      end

      it 'ユーザー本名の名前と名字のフリガナそれぞれに、カタカナが使用されていれば登録できる' do
        @user.first_name_kana = 'サトウ'
        @user.last_name_kana = 'ヒカル'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかない時' do
      it 'nicknameが空だと登録できない' do
        user = User.new(nickname: '', email: 'aaa@gmail.com', first_name: '青木', first_name_kana: 'あおき', last_name: '浩輝', last_name_kana: 'こうき', password: '1111aaaa', password_confirmation: '1111aaaa', birthday: '1999-09-09')
        user.valid?
        expect(user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空だと登録できない' do
        user = User.new(nickname: 'koki', email: '', first_name: '青木', first_name_kana: 'あおき', last_name: '浩輝', last_name_kana: 'こうき', password: '1111aaaa', password_confirmation: '1111aaaa', birthday: '1999-09-09')
        user.valid?
        expect(user.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordが空だと登録できない' do
        user = User.new(nickname: 'koki', email: 'aaa@gmail.com', first_name: '青木', first_name_kana: 'あおき', last_name: '浩輝', last_name_kana: 'こうき', password: '', password_confirmation: '', birthday: '1999-09-09')
        user.valid?
        expect(user.errors.full_messages).to include("Password can't be blank")
      end

      it 'ユーザー本名の名字が空だと登録できない' do
        user = User.new(nickname: 'koki', email: 'aaa@gmail.com', first_name: '', first_name_kana: 'あおき', last_name: '浩輝', last_name_kana: 'こうき', password: '1111aaaa', password_confirmation: '1111aaaa', birthday: '1999-09-09')
        user.valid?
        expect(user.errors.full_messages).to include("First name can't be blank")
      end

      it 'ユーザー本名の名字のフリガナが空だと登録できない' do
        user = User.new(nickname: 'koki', email: 'aaa@gmail.com', first_name: '青木', first_name_kana: '', last_name: '浩輝', last_name_kana: 'こうき', password: '1111aaaa', password_confirmation: '1111aaaa', birthday: '1999-09-09')
        user.valid?
        expect(user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'ユーザー本名の名前が空だと登録できない' do
        user = User.new(nickname: 'koki', email: 'aaa@gmail.com', first_name: '青木', first_name_kana: 'あおき', last_name: '', last_name_kana: 'こうき', password: '1111aaaa', password_confirmation: '1111aaaa', birthday: '1999-09-09')
        user.valid?
        expect(user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'ユーザー本名の名前のフリガナが空だと登録できない' do
        user = User.new(nickname: 'koki', email: 'aaa@gmail.com', first_name: '青木', first_name_kana: 'あおき', last_name: '浩輝', last_name_kana: '', password: '1111aaaa', password_confirmation: '1111aaaa', birthday: '1999-09-09')
        user.valid?
        expect(user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it 'birthdayが空だと登録できない' do
        user = User.new(nickname: 'koki', email: 'aaa@gmail.com', first_name: '青木', first_name_kana: 'あおき', last_name: '浩輝', last_name_kana: 'こうき', password: '1111aaaa', password_confirmation: '1111aaaa', birthday: '')
        user.valid?
        expect(user.errors.full_messages).to include("Birthday can't be blank")
      end

      it 'メールアドレスは重複してはならない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'メールアドレスには@が含まれていなければならない' do
        @user.email = 'aaagmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'パスワードは６文字以上必要である' do
        @user.password = '11aaa'
        @user.password_confirmation = '11aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'パスワードは半角英数字混合で入力する必要がある' do
        @user.password = '11111111'
        @user.password_confirmation = '11111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'パスワードは確認用のものと一致してなければならない' do
        @user.password_confirmation = '2222bbbbb'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
