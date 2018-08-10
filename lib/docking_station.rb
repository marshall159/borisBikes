require_relative 'bike'

class DockingStation
  attr_reader :docked_bikes

  def initialize
    @docked_bikes = []
  end

  def release_bike
    # Bike.new
    raise("There are no bikes") if @docked_bikes.empty?
    @docked_bikes.pop
  end

  def dock(bike)
    raise("Dock Full") if @docked_bikes.length >= 1
    @docked_bikes << bike
  end


end
