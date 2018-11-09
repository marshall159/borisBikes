require_relative 'bike'

class DockingStation
  attr_reader :bike #, :capacity
  # DEFAULT_CAPACITY = 20

  @bike = nil

  # def initialize(capacity = DEFAULT_CAPACITY)
  #   @docked_bikes = []
  #   @docked_broken_bikes = []
  #   @capacity = capacity
  # end

  def release_bike
    # guard condition
    raise("There are no bikes") unless bike
    # raise("Broken bike") if docked_bikes.last.broken?
    # docked_bikes.pop
    bike
  end

  def dock(bike)
    # raise("Dock Full") if full?
    # docked_bikes << bike
    # @docked_bikes = bike
    @bike = bike 
  end

  # def dock_broken_bike(bike)
  #   raise("Dock Full") if full?
  #   docked_broken_bikes << bike
  # end

  # private

  # def full?
  #   docked_bikes.length >= DEFAULT_CAPACITY
  # end

  # def empty?
  #   docked_bikes.empty?
  # end
end
