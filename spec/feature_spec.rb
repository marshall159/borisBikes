require "docking_station"

describe "Docking station capacity can be set" do 
    docking_station = DockingStation.new(50)
    bike = Bike.new
    docking_station.dock(bike)
end