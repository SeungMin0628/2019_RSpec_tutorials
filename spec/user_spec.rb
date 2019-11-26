require 'spec_helper'

# before: テストの以前に共通処理するべきのものやデータのセットアップを定義する。
# let(:変数名) { ... } : RSpecの中で利用する変数。遅延評価により、必要される変数だけが呼び出される
#     = typoを防げる → インスタンス変数を定義すると初期化されるnilにより、テストで不具合が発生する恐れがある
#     = 無駄な初期化の時間をなくす →　letが呼び出されるのは、その変数が使われる時だけ

RSpec.describe User do
  describe '#greet' do
    let(:user) { User.new(params) }
    let(:params) { { name: 'やまだ', age: age } }

    context '12歳以下の場合' do
      let(:age) { 12 }
      it 'ひらがなで自己紹介するもの' do
        expect(user.greet).to eq 'ぼくはやまだだよ。'
      end
    end

    context '13歳以上の場合' do
      let(:age) { 13 }
      it '漢字で自己紹介するもの' do
        expect(user.greet).to eq '僕はやまだです。'
      end
    end
  end
end
