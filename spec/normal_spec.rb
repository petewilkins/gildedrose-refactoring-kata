require 'normal'

describe Normal do
  it 'reduces the sellIn by 1' do
    items = [Item.new('Normal', 10, 20)]
    GildedRose.new(items)
    expect(items[0].sell_in).to eq 9
  end

  it 'reduces the quality by 1' do
    items = [Item.new('Normal', 10, 20)]
    GildedRose.new(items)
    expect(items[0].quality).to eq 19
  end

  it 'reduces the quality by 2 after sellIn is 0' do
    items = [Item.new('Normal', 0, 20)]
    GildedRose.new(items)
    expect(items[0].quality).to eq 18
  end

  it 'quality cant be below 0' do
    items = [Item.new('Normal', 10, 0)]
    GildedRose.new(items)
    expect(items[0].quality).to eq 0
  end
end
