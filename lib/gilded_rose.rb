class GildedRose

  def initialize(*items)
    @items = []
    items.each { |item| @items.push(item) }
  end
  
  def update_quality()
    @items.each do |item|
      next if item.name == 'Sulfuras'
  
      if item.name == "Aged Brie"
        increase_quality(item)
      elsif item.name == "Backstage passes"
        increase_quality(item)
        increase_quality(item) if item.sell_in < 11
        increase_quality(item) if item.sell_in < 6
      else
        decrease_quality(item)
      end
  
      decrease_sell_in(item)
  
      if item.sell_in < 0
        if item.name == "Aged Brie"
          increase_quality(item)
        elsif item.name == "Backstage passes"
          item.quality -= item.quality
        else
          decrease_quality(item)
        end
      end
    end
  end
  
  def increase_quality(item)
    return if item.quality >= 50
  
    item.quality += 1
  end
  
  def decrease_quality(item)
    return if item.quality <= 0
    item.quality -= 1 if item.class == ConjuredItem
    item.quality -= 1

  end
  
  def decrease_sell_in(item)
    return if item.name == "Sulfuras"
  
    item.sell_in -= 1
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

class ConjuredItem < Item

end


  
  
  
  # laptop setup
  # def update_quality()
  #   @items.each do |item|
  #     return item if item.name == 'Sulfuras'
  #     if item.name != "Aged Brie" && item.name != "Backstage passes"
  #       if item.quality > 0 
  #         if item.name != "Sulfuras"
  #           item.quality -= 1
  #         end
  #       end
  #     else
  #       if item.quality < 50
  #         item.quality += 1
  #         if item.name == "Backstage passes"
  #           if item.sell_in < 11
  #             if item.quality < 50
  #               item.quality += 1
  #             end
  #           end
  #           if item.sell_in < 6
  #             if item.quality < 50
  #               item.quality += 1
  #             end
  #           end
  #         end
  #       end
  #     end
  #     if item.name != "Sulfuras"
  #       item.sell_in = item.sell_in - 1
  #     end
  #     if item.sell_in < 0
  #       if item.name != "Aged Brie"
  #         if item.name != "Backstage passes"
  #           if item.quality > 0
  #             if item.name != "Sulfuras"
  #               item.quality -= 1
  #             end
  #           end
  #         else
  #           item.quality -= item.quality
  #         end
  #       else
  #         if item.quality < 50
  #           item.quality += 1
  #         end
  #       end
  #     end
  #   end
  # end