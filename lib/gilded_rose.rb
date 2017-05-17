class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      index = @items.index(item)
      case item.name
      when 'Aged Brie'
        item = AgedBrie.new(item.quality, item.sell_in)
        item.update_quality
      when 'Sulfuras, Hand of Ragnaros'
        item = Sulfuras.new(item.quality, item.sell_in)
        item.update_quality
      when 'Backstage passes to a TAFKAL80ETC concert'
        item = BackstagePasses.new(item.quality, item.sell_in)
        item.update_quality
      else
        item = Normal.new(item.quality, item.sell_in)
        item.update_quality
      end
      @items[index] = item
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
