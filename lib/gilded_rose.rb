class GildedRose

  def initialize(items)
    @items = items
  end

  def normal_tick(item)
    item.sell_in -= 1
    return if item.quality.zero?
    item.quality -= 1
    item.quality -= 1 if item.sell_in <= 0
  end

  def brie_tick(item)
    item.sell_in -= 1
    return if item.quality >= 50
    item.quality += 1
    item.quality += 1 if item.sell_in <= 0
  end

  def sulfuras_tick(item)
  end

  def backstage_tick(item)
    item.sell_in -= 1
    return if item.quality >= 50
    return item.quality = 0 if item.sell_in <= 0
    item.quality += 1
    item.quality += 1 if item.sell_in < 10
    item.quality += 1 if item.sell_in < 5
  end

  def update_quality
    @items.each do |item|
      case item.name
      when 'Normal'
        return normal_tick(item)
      when 'Aged Brie'
        return brie_tick(item)
      when 'Sulfuras, Hand of Ragnaros'
        return sulfuras_tick(item)
      when 'Backstage passes to a TAFKAL80ETC concert'
        return backstage_tick(item)
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
