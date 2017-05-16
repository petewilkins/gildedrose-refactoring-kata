require 'backstage_passes'

describe BackstagePasses do
  it 'reduces the sellIn by 1' do
    items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 20)]
    GildedRose.new(items).update_quality
    expect(items[0].sell_in).to eq 9
  end

  it 'increases the quality by 1 when sellIn is more than 10 days' do
    items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 11, 20)]
    GildedRose.new(items).update_quality
    expect(items[0].quality).to eq 21
  end

  it 'increases the quality by 2 when sellIn is between 6-10 days' do
    items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 20)]
    GildedRose.new(items).update_quality
    expect(items[0].quality).to eq 22
  end

  it 'increases the quality by 3 when sellIn is between 1-5 days' do
    items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 20)]
    GildedRose.new(items).update_quality
    expect(items[0].quality).to eq 23
  end

  it 'quality is 0 when the sellIn is 0 days' do
    items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 0, 20)]
    GildedRose.new(items).update_quality
    expect(items[0].quality).to eq 0
  end
end
