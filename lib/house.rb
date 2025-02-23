class House
  attr_reader :price, :address, :rooms

  def initialize(price, address)
    @price = price.delete("$").to_i
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    @price > 500000
  end

  def rooms_from_category(room_category)
    @rooms.find_all {|room| room.category == room_category}
  end

  def area
    @rooms.sum {|room| room.area}
  end

  def details
    details = {"price" => @price, "address" => @address}
  end

  def price_per_square_foot
    (@price.to_f / area).round(2)
  end

  def rooms_sorted_by_area
    @rooms.map.sort {|room| room.area}
  end

  def rooms_by_category
    rooms_by_category = {:bedroom => rooms_from_category(:bedroom), :living_room => rooms_from_category(:living_room), :basement => rooms_from_category(:basement)}
  end
end
