require 'rails_helper'

RSpec.describe Article, type: :model do
  before do
    @article = FactoryBot.build(:article)
  end

  describe '記事投稿機能' do
    context '記事投稿できるとき' do
      it 'すべての項目が存在すれば登録できる' do
        expect(@article).to be_valid
      end
    end

    context '記事投稿できないとき' do
      it 'imageが空では登録できない' do
        @article.image = nil
        @article.valid?
        expect(@article.errors.full_messages).to include('画像を選択してください')
      end
      it 'titleが空では登録できない' do
        @article.title = ''
        @article.valid?
        expect(@article.errors.full_messages).to include('タイトルを入力してください')
      end
      it 'textが空では登録できない' do
        @article.text = ''
        @article.valid?
        expect(@article.errors.full_messages).to include('本文を入力してください')
      end
      it 'ユーザーが紐付いていないと登録できない' do
        @article.user = nil
        @article.valid?
        expect(@article.errors.full_messages).to include('ユーザーを入力してください')
      end
    end
  end
end
