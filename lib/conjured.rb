class Conjured
  attr_reader :quality, :sell_in

  def initialize(quality, sell_in)
    @quality = quality
    @sell_in = sell_in
  end

  def update_quality
    @sell_in -= 1
    return if @quality <= 0
    @quality -= 2
    @quality -= 2 if @sell_in <= 0
  end
end
