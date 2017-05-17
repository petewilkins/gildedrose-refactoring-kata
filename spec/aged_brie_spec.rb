require 'aged_brie'

describe AgedBrie do
  it 'reduces the sellIn by 1' do
    items = [Item.new('Aged Brie', 10, 20)]
    GildedRose.new(items)
    expect(items[0].sell_in).to eq 9
  end

  it 'increases the quality by 1' do
    items = [Item.new('Aged Brie', 10, 20)]
    GildedRose.new(items)
    expect(items[0].quality).to eq 21
  end

  it 'increases the quality by 2 after sellIn is 0' do
    items = [Item.new('Aged Brie', 0, 20)]
    GildedRose.new(items)
    expect(items[0].quality).to eq 22
  end

  it 'quality cant go above 50' do
    items = [Item.new('Aged Brie', 10, 50)]
    GildedRose.new(items)
    expect(items[0].quality).to eq 50
  end
end
