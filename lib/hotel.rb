class Hotel
  def initialize(num_rooms)
    @rooms = Array.new(num_rooms, []) # [ [], [], [], [],... ]
  end

  def rooms
    @rooms
  end

  def reserve(room_num, start_date, end_date)
    @rooms[room_num] << Reservation.new(start_date, end_date)
  end

  def reservations_on(date)
    @rooms.flatten.select do |reservation|
      reservation.include?(date)
    end
  end

  def get_reservation(id)
    @rooms.flatten.select do |reservation|
      Reservation.id == id
    end
  end

  def get_reservation_cost(id)
    get_reservation(id).total_cost
  end
end
