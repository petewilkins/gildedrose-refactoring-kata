class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    items.each do |item|
      index = items.index(item)
      item = klass_for(item.name).new(item.quality, item.sell_in)
      item.update_quality
      items[index] = item
    end
  end

  private

  attr_reader :items

  def klass_for(name)
    case name
    when 'Aged Brie'
      AgedBrie
    when 'Sulfuras, Hand of Ragnaros'
      Sulfuras
    when 'Backstage passes to a TAFKAL80ETC concert'
      BackstagePasses
    when 'Conjured'
      Conjured
    else
      Normal
    end
  end
end
