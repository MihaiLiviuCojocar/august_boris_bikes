class Person
  def initialize(bike: nil)
    @bike = bike
  end

  def has_bike?
    !@bike.nil?
  end

  def rent_bike_from station
    @bike = station.release_a_bike
  end

  def return_bike_to station
    station.dock(@bike)
    @bike = nil
  end

  def have_accident!
    @bike.break!
  end
end
