require 'spec_helper'

# before: テストの以前に共通処理するべきのものやデータのセットアップを定義する。

RSpec.describe User do
  describe '#greet' do
    before do
      @params = { name: 'やまだ' }
    end

    context '12歳以下の場合' do
      before do
        @params.merge!(age: 12)
      end

      it 'ひらがなで自己紹介するもの' do
        user = User.new(@params)
        expect(user.greet).to eq 'ぼくはやまだだよ。'
      end
    end

    context '13歳以上の場合' do
      before do
        @params.merge!(age: 13)
      end

      it '漢字で自己紹介するもの' do
        user = User.new(@params)
        expect(user.greet).to eq '僕はやまだです。'
      end
    end
  end
end
