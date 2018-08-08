require "boris_bikes"

describe DockingStation do

  before do
    @docking_station = DockingStation.new
  end

  it "should create new object of class DockingStation" do
    expect(@docking_station.class).to eq DockingStation
  end

end
