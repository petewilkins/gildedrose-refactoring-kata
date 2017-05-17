require 'sulfuras'

describe Sulfuras do
  it 'never reduces in quality' do
    items = [Item.new('Sulfuras, Hand of Ragnaros', 10, 20)]
    GildedRose.new(items)
    expect(items[0].quality).to eq 20
  end

  it 'never reduces the sellIn' do
    items = [Item.new('Sulfuras, Hand of Ragnaros', 10, 20)]
    GildedRose.new(items)
    expect(items[0].sell_in).to eq 10
  end
end
