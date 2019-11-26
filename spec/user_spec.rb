require 'spec_helper'

# before: テストの以前に共通処理するべきのものやデータのセットアップを定義する。
# let(:変数名) { ... } : RSpecの中で利用する変数。遅延評価により、必要される変数だけが呼び出される
#     = typoを防げる → インスタンス変数を定義すると初期化されるnilにより、テストで不具合が発生する恐れがある
#     = 無駄な初期化の時間をなくす →　letが呼び出されるのは、その変数が使われる時だけ
# subject { ... } : テスト対象のオブジェクトが1つに決まっている場合に利用。expect(...)を1つの文章にまとめ、DRYなコードを書くのができる
#     = subjectで定義したコードは、`is_expected`メソッドで呼び出すことができる
#     = it '...' do ... end のブロックを it { is_expected.to ... } で省略するのができる

RSpec.describe User do
  describe '#greet' do
    let(:user) { User.new(params) }
    let(:params) { { name: 'やまだ', age: age } }
    subject { user.greet } 

    context '12歳以下の場合' do
      let(:age) { 12 }
      it { is_expected.to eq 'ぼくはやまだだよ。' } 
    end

    context '13歳以上の場合' do
      let(:age) { 13 }
      it { is_expected.to eq '僕はやまだです。' } 
    end
  end
end
