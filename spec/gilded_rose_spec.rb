require 'gilded_rose'

describe GildedRose do
  describe '#regular item' do
    it 'reduces the sellIn by 1' do
      items = [Item.new('Flowers', 10, 20)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq 9
    end

    it 'reduces the quality by 1' do
      items = [Item.new('Flowers', 10, 20)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 19
    end

    it 'reduces the quality by 2 after sell-by-date' do
      items = [Item.new('Flowers', 0, 20)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 18
    end

    it 'quality cant be below 0' do
      items = [Item.new('Flowers', 10, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 0
    end
  end

  describe '#aged brie' do
    it 'reduces the sellIn by 1' do
      items = [Item.new('Aged Brie', 10, 20)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq 9
    end

    it 'increases the quality by 1' do
      items = [Item.new('Aged Brie', 10, 20)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 21
    end

    it 'increases the quality by 2 after sellIn is 0' do
      items = [Item.new('Aged Brie', 0, 20)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 22
    end

    it 'quality cant go above 50' do
      items = [Item.new('Aged Brie', 10, 50)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 50
    end
  end

  describe '#sulfuras' do
    it 'never reduces in quality' do
      items = [Item.new('Sulfuras, Hand of Ragnaros', 10, 20)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 20
    end

    it 'never reduces the sellIn' do
      items = [Item.new('Sulfuras, Hand of Ragnaros', 10, 20)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq 10
    end
  end

  describe '#backstage passes' do
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

  describe '#conjured' do
    xit 'reduces the sellIn by 1' do
      items = [Item.new('Conjured', 10, 20)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq 9
    end

    xit 'reduces the quality by 2' do
      items = [Item.new('Conjured', 10, 20)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 18
    end

    xit 'reduces the quality by 4 after sell-by-date' do
      items = [Item.new('Conjured', 0, 20)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 16
    end

    xit 'quality cant be below 0' do
      items = [Item.new('Conjured', 10, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 0
    end
  end
end
