require 'spec_helper'

# before: テストの以前に共通処理するべきのものやデータのセットアップを定義する。
# let(:変数名) { ... } : RSpecの中で利用する変数。遅延評価により、必要される変数だけが呼び出される
#     = typoを防げる → インスタンス変数を定義すると初期化されるnilにより、テストで不具合が発生する恐れがある
#     = 無駄な初期化の時間をなくす →　letが呼び出されるのは、その変数が使われる時だけ
# subject { ... } : テスト対象のオブジェクトが1つに決まっている場合に利用。expect(...)を1つの文章にまとめ、DRYなコードを書くのができる
#     = subjectで定義したコードは、`is_expected`メソッドで呼び出すことができる
#     = it '...' do ... end のブロックを it { is_expected.to ... } で省略するのができる
# テストコードの共有
#     = shared_examples : 共有しようとするコードを定義する
#     = it_behaves_like : テストの結果として期待する振る舞いを読み取る
# contextの共有
#     = shared_context : 共有しようとするcontextを定義する
#     = include_context : 定義したshared_contextを利用する
# booleanの検証で書き換える
#     = expect(...).to eq true => expect(...).to be_truthy
#     = expect(...).to eq false => expect(...).to be_falsy

RSpec.describe User do
  let(:user) { User.new(name: 'やまだ', age: age) }
  shared_context '0歳の場合' do
    let(:age) { 0 }
  end

  shared_context '12歳の場合' do
    let(:age) { 12 }
  end

  shared_context '13歳の場合' do
    let(:age) { 13 }
  end

  shared_context '100歳の場合' do
    let(:age) { 100 }
  end

  describe '#greet' do
    subject { user.greet } 

    shared_examples '子供の挨拶' do
      it { is_expected.to eq 'ぼくはやまだだよ。' } 
    end

    shared_examples '大人の挨拶' do
      it { is_expected.to eq '僕はやまだです。' } 
    end

    context '0歳の場合' do
      include_context '0歳の場合'
      it_behaves_like '子供の挨拶'
    end

    context '12歳の場合' do
      include_context '12歳の場合'
      it_behaves_like '子供の挨拶'
    end

    context '13歳以上の場合' do
      include_context '13歳の場合'
      it_behaves_like '大人の挨拶'
    end

    context '100歳の場合' do
      include_context '100歳の場合'
      it_behaves_like '大人の挨拶'
    end
  end

  describe "#child?" do
    subject { user.child? } 

    context "0歳の場合" do
      include_context '0歳の場合'
      it { is_expected.to be_truthy } 
    end

    context "12歳の場合" do
      include_context '12歳の場合'
      it { is_expected.to be_truthy } 
    end

    context "13歳の場合" do
      include_context '13歳の場合'
      it { is_expected.to be_falsy } 
    end

    context "100歳の場合" do
      include_context '100歳の場合'
      it { is_expected.to be_falsy } 
    end
  end
end
