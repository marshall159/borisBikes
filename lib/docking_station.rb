require_relative 'bike'

class DockingStation
  attr_reader :bikes #, :capacity
  DEFAULT_CAPACITY = 20

  def initialize()
    @bikes = []
    # @docked_broken_bikes = []
    # @capacity = capacity
  end

  def dock(bike)
    # guard condition
    raise("Docking Station Full") if full?
    @bikes << bike
    bike  
  end

  def release_bike
    # guard condition
    raise("There are no bikes") if empty? 
    # raise("Broken bike") if docked_bikes.last.broken?
    bikes.pop 
  end

  private

  def full? 
    bikes.length >= DEFAULT_CAPACITY
  end

  def empty?
    bikes.empty?
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
