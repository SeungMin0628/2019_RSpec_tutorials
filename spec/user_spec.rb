require 'spec_helper'

# before: テストの以前に共通処理するべきのものやデータのセットアップを定義する。
# let(:変数名) { ... } : RSpecの中で利用する変数。遅延評価により、必要される変数だけが呼び出される
#     = typoを防げる → インスタンス変数を定義すると初期化されるnilにより、テストで不具合が発生する恐れがある
#     = 無駄な初期化の時間をなくす →　letが呼び出されるのは、その変数が使われる時だけ
# subject { ... } : テスト対象のオブジェクトが1つに決まっている場合に利用。expect(...)を1つの文章にまとめ、DRYなコードを書くのができる
#     = subjectで定義したコードは、`is_expected`メソッドで呼び出すことができる
#     = it '...' do ... end のブロックを it { is_expected.to ... } で省略するのができる
# テストコードの共有
#     = shared_examples
#     = it_behaves_like : 

RSpec.describe User do
  describe '#greet' do
    let(:user) { User.new(name: 'やまだ', age: age) }
    subject { user.greet } 

    shared_examples '子供の挨拶' do
      it { is_expected.to eq 'ぼくはやまだだよ。' } 
    end

    shared_examples '大人の挨拶' do
      it { is_expected.to eq '僕はやまだです。' } 
    end

    context '0歳の場合' do
      let(:age) { 0 }
      it_behaves_like '子供の挨拶'
    end

    context '12歳の場合' do
      let(:age) { 12 }
      it_behaves_like '子供の挨拶'
    end

    context '13歳以上の場合' do
      let(:age) { 13 }
      it_behaves_like '大人の挨拶'
    end

    context '100歳の場合' do
      let(:age) { 100 }
      it_behaves_like '大人の挨拶'
    end
  end
end
