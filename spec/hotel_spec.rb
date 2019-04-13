require_relative "spec_helper"

describe "hotel" do
  before do
    @hotel = Hotel.new(20)
    # upto iterates the given block, passing in integer values from int up to and including limit
    1.upto(20) do |i|
      @hotel.get_room(i).reserve(
        Date.new(2019, 04, 01),
        Date.new(2019, 04, 15)
      )
    end

    10.upto(20) do |i|
      @hotel.get_room(i).reserve(
        Date.new(2019, 03, 21),
        Date.new(2019, 04, 01)
      )
    end
  end

  it "can get a room based on its number" do
    expect(@hotel.get_room(10)).must_be_instance_of(Room)
  end
end
