require 'gilded_rose'

describe GildedRose do
  describe '#update_quality' do
    it 'does not change the name' do
      item = Item.new('foo', 0, 0)
      GildedRose.new(item).update_quality()
      expect(item.name).to eq('foo')
    end
    it 'decreases a standard item by 1 in sell-in and quality' do
      glass = Item.new('opaque', 10, 10)
      GildedRose.new(glass).update_quality
      expect(glass.sell_in).to eq(9)
      expect(glass.quality).to eq(9)
    end
    it 'cannot decrease a standard item\'s quality to a negative' do
      glass = Item.new('opaque', 0, 0)
      GildedRose.new(glass).update_quality
      expect(glass.sell_in).to eq(-1)
      expect(glass.quality).to eq(0)
    end
    it 'cannot increase an item\'s quality above 50' do
      cheese = Item.new('Aged Brie', 10, 50)
      GildedRose.new(cheese).update_quality
      expect(cheese.sell_in).to eq(9)
      expect(cheese.quality).to eq(50)
    end
    it 'a standard item\'s quality decreases twice as fast once past the sell-in date' do
      glass = Item.new('opaque', 0, 10)
      GildedRose.new(glass).update_quality
      GildedRose.new(glass).update_quality
      expect(glass.sell_in).to eq(-2)
      expect(glass.quality).to eq(6)
    end
    it 'increases Aged Brie overtime' do
      cheese = Item.new('Aged Brie', 10, 30)
      GildedRose.new(cheese).update_quality
      expect(cheese.sell_in).to eq(9)
      expect(cheese.quality).to eq(31)
    end
    it 'dosen\'t alter Sulfuras in quality' do
      weapon = Sulfuras.new('Sulfuras', 30)
      GildedRose.new(weapon).update_quality
      expect(weapon.quality).to eq(30)
    end
    it 'increases Backstage Passes\'s quality by 1 before 10 sell-in mark' do
      pass = Item.new('Backstage passes', 30, 30)
      GildedRose.new(pass).update_quality
      expect(pass.quality).to eq(31)
      expect(pass.sell_in).to eq(29)
    end
    it 'increases Backstage Passes\'s quality by 2 between day 6-10 of sell in' do 
      pass = Item.new('Backstage passes', 10, 30)
      GildedRose.new(pass).update_quality
      expect(pass.quality).to eq(32)
      expect(pass.sell_in).to eq(9)
    end 
  end
end