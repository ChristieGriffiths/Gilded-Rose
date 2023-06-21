class GildedRose

  def initialize(*items)
    @items = []
    items.each { |item| @items.push(item) }
  end

  def update_quality()
    @items.each do |item|
      p "before #{item.quality}"
      return item if item.name == 'Sulfuras'
      if item.name != "Aged Brie" && item.name != "Backstage passes"
        if item.quality > 0 
          if item.name != "Sulfuras"
            item.quality = item.quality - 1
          end
        end
      else
        if item.quality < 50
          item.quality = item.quality + 1
          p "after 2 #{item.quality}"
          if item.name == "Backstage passes"
            if item.sell_in < 11
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
            if item.sell_in < 6
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
          end

        end
      end
      if item.name != "Sulfuras"
        item.sell_in = item.sell_in - 1
      end
      if item.sell_in < 0
        if item.name != "Aged Brie"
          if item.name != "Backstage passes"
            if item.quality > 0
              if item.name != "Sulfuras"
                item.quality = item.quality - 1
              end
            end
          else
            item.quality = item.quality - item.quality
          end
        else
          if item.quality < 50
            item.quality = item.quality + 1
          end
        end
      end
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end

class Sulfuras < Item
  def initialize(name, quality, sell_in = nil)
    @name = name
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@quality}"
  end
end 

