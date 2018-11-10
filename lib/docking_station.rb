require_relative 'bike'

class DockingStation
  attr_reader :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    # @broken_bikes = []
    @capacity = capacity
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
    return_working_bike 
  end

  private

  attr_reader :bikes

  def full? 
    bikes.length >= capacity
  end

  def empty?
    bikes.empty?
  end

  def return_working_bike
    bikes.select { |bike| !bike.broken? }.pop
  end

end
