require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      item = Item.new("foo", 0, 0)
      GildedRose.new(item).update_quality()
      expect(itemsname).to eq "foo"
    end
  end

end