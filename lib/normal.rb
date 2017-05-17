class Normal
  attr_reader :quality, :sell_in

  def initialize(quality, sell_in)
    @quality = quality
    @sell_in = sell_in
  end

  def update_quality
    @sell_in -= 1
    return if @quality.zero?
    @quality -= 1
    @quality -= 1 if @sell_in <= 0
  end
end
