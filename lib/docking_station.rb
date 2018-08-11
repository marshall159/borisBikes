require_relative 'bike'

class DockingStation
  attr_reader :docked_bikes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize
    @docked_bikes = []
    @capacity = 20
  end

  def release_bike
    raise("There are no bikes") if empty?
    docked_bikes.pop
  end

  def dock(bike)
    raise("Dock Full") if full?
    docked_bikes << bike
  end

  def full?
    docked_bikes.length >= capacity
  end

  def empty?
    docked_bikes.empty?
  end
end
