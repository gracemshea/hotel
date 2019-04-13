require_relative "room"

class Hotel
  def initialize(num_rooms)
    @rooms = Array.new(num_rooms) do |index|
      Room.new(index)
    end
  end=

  def rooms
    @rooms
  end

  def get_room(num)
    @rooms[num - 1]
  end

  def reservations_on(date)
    @rooms.map do |room|
      room.reservations_for(date)
      # flatten will take the array of arrays and create a 1d array from the 2d array
    end.flatten
  end

  def rooms_reserved_on(date)
    @rooms.select do |room|
      room.reserved_on?(date)
    end
  end

  def rooms_available_on(date)
    @rooms.reject do |room|
      room.reserved_on?(date)
    end
  end

  def get_reservation(id)
    @rooms.each do |room|
      reservation = room.get_reservation(id)
      return reservation if reservation
    end
    nil
  end
end
