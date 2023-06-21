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
    it 'cannot decrease a standard item"s quality to a negative' do
      glass = Item.new('opaque', 0, 0)
      GildedRose.new(glass).update_quality
      expect(glass.sell_in).to eq(-1)
      expect(glass.quality).to eq(0)
    end
  end
end