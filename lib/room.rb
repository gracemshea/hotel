require_relative "reservation"

class Room
  def initialize(number)
    @number = number
    @reservations = []
  end

  # *args allows you to call the method with any number of arguments, including none
  def reserve(*args)
    @reservations << Reservation.new(self, *args)
  end

  def reserved_on?(dates)
    reservations_for(dates).any?
  end

  def get_reservation(id)
    @reservations.detect do |reservation|
      reservation.id == id
    end
  end

  def reservations_for(dates)
    if dates.is_a?(Range)
      reservations = []
      dates.each do |date|
        reservations << reservations_for(date)
      end
      # .compact removes nil values from the array
      return reservations.compact
    end
    # detect and find are two names for the same method
    @reservations.detect? do |reservation|
      reservation.include?(dates)
    end
  end
end
