require 'conjured'

describe Conjured do
  it 'reduces the sellIn by 1' do
    items = [Item.new('Conjured', 10, 20)]
    GildedRose.new(items)
    expect(items[0].sell_in).to eq 9
  end

  it 'reduces the quality by 2' do
    items = [Item.new('Conjured', 10, 20)]
    GildedRose.new(items)
    expect(items[0].quality).to eq 18
  end

  it 'reduces the quality by 4 after sell-by-date' do
    items = [Item.new('Conjured', 0, 20)]
    GildedRose.new(items)
    expect(items[0].quality).to eq 16
  end

  it 'quality cant be below 0' do
    items = [Item.new('Conjured', 10, 0)]
    GildedRose.new(items)
    expect(items[0].quality).to eq 0
  end
end
