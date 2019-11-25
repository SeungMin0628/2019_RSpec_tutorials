require 'spec_helper'

# describe {}: テストのグループ。大分類。describeの内容をdescribeで分けることもできる。
# context {}: describeと同じ役割。条件を分ける際に主に利用する
# it {}: example 単位でテストをまとめる。 小分類。このブロックで含まっている`expect`が全てパスすると、このテストは成功。
# テストの不合格の報告はit単位で行われる

# expect(X).to eq Y: このテストで期待することを記述する

RSpec.describe '四則演算' do
  describe '足し算' do
    
    describe '自然数の足し算' do
      it '5+8は13になるもの' do
        expect(5 + 8).to eq 13
      end
    end

    describe '負の整数の足し算' do
      it '(-8)+(-3)は(-11)になるもの' do
        expect((-8) + (-3)).to eq (-11)
      end
    end
  end

  describe '引き算' do
    it '3-2は1になるもの' do
      expect(3 - 2).to eq 1
    end
  end

  describe '掛け算' do
    it '7*6は42になるもの' do
      expect(7 * 6).to eq 42
    end
  end

  describe '割り算' do
    it '12/6は2になるもの' do
      expect(12 / 6).to eq 2
    end
  end
end
