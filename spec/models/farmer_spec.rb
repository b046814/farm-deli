require 'rails_helper'

RSpec.describe Farmer, type: :model do
  describe '#create' do
    before do
      @farmer = FactoryBot.build(:farmer)
    end

    context 'ユーザー登録（生産者）ができる時' do
      it '全ての情報が入力されている場合は登録できる' do
        expect(@farmer).to be_valid
      end

      it 'パスワードが6字以上であれば登録できる' do
        @farmer.password = '123abc'
        @farmer.password_confirmation = '123abc'
        expect(@farmer).to be_valid
      end
    end
  
    context 'ユーザー登録（生産者）ができない時' do
      it 'nicknameが空では登録できない' do
        @farmer.nickname = nil
        @farmer.valid?
        expect(@farmer.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できないこと' do
        @farmer.email = nil
        @farmer.valid?
        expect(@farmer.errors.full_messages).to include("Email can't be blank")
      end
      
      it 'emailが重複すると登録できない' do
        @farmer.save
        another_farmer = FactoryBot.build(:farmer)
        another_farmer.email = @farmer.email
        another_farmer.valid?
        expect(another_farmer.errors.full_messages).to include("Email has already been taken")
      end
    
      it 'emailに@が含まれていないと登録できない' do
        @farmer.email = 'samplesample.com'
        @farmer.valid?
        expect(@farmer.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空では登録できない' do
        @farmer.password = nil
        @farmer.valid?
        expect(@farmer.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下では登録できない' do
        @farmer.password = '12abc'
        @farmer.password_confirmation = '12abc'
        @farmer.valid?
        expect(@farmer.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordに半角数字しか含まれていない場合は登録できない' do
        @farmer.password = '1111111'
        @farmer.password_confirmation = '1111111'
        @farmer.valid?
        expect(@farmer.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordに半角英字しか含まれていない場合は登録できない' do
        @farmer.password = 'eeeeee'
        @farmer.password_confirmation = 'eeeeee'
        @farmer.valid?
        expect(@farmer.errors.full_messages).to include('Password is invalid')
      end

      it 'password_confirmationが空では登録できない' do
        @farmer.password_confirmation = ''
        @farmer.valid?
        expect(@farmer.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'last_nameが空では登録できない' do
        @farmer.last_name = nil
        @farmer.valid?
        expect(@farmer.errors.full_messages).to include("Last name can't be blank")
      end

      it 'last_nameに全角ひらがな、カタカナ、漢字以外が入力されると登録できない' do
        @farmer.last_name = 'tom'
        @farmer.valid?
        expect(@farmer.errors.full_messages).to include('Last name is invalid')
      end

      it 'first_nameが空では登録できない' do
        @farmer.first_name = nil
        @farmer.valid?
        expect(@farmer.errors.full_messages).to include("First name can't be blank")
      end

      it 'first_nameに全角ひらがな、カタカナ、漢字以外が入力されると登録できない' do
        @farmer.first_name = 'tom'
        @farmer.valid?
        expect(@farmer.errors.full_messages).to include('First name is invalid')
      end

      it 'last_name_kanaが空では登録できない' do
        @farmer.last_name_kana = nil
        @farmer.valid?
        expect(@farmer.errors.full_messages).to include("Last name kana can't be blank")
      end

      it 'last_name_kanaに全角カタカナ以外が入力されると登録できない' do
        @farmer.last_name_kana = 'としき'
        @farmer.valid?
        expect(@farmer.errors.full_messages).to include('Last name kana is invalid')
      end

      it 'first_name_kanaが空では登録できない' do
        @farmer.first_name_kana = nil
        @farmer.valid?
        expect(@farmer.errors.full_messages).to include("First name kana can't be blank")
      end
      
      it 'first_name_kanaに全角カタカナ以外が入力されると登録できない' do
        @farmer.first_name_kana = 'としき'
        @farmer.valid?
        expect(@farmer.errors.full_messages).to include('First name kana is invalid')
      end

      it 'birth_dateが空では登録できない' do
        @farmer.birth_date = nil
        @farmer.valid?
        expect(@farmer.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
