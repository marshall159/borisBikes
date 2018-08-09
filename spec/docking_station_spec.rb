require "docking_station"

describe DockingStation do

  before do
    @docking_station = DockingStation.new
  end

  it "creates new object of class DockingStation" do
    expect(@docking_station.class).to eq DockingStation
  end

  it "releases a bike" do
    bike = Bike.new
    @docking_station.dock(bike)
    expect(@docking_station.release_bike).to eq bike
  end

  it 'gets working bike' do
    bike = Bike.new
    @docking_station.dock(bike)
    released_bike = @docking_station.release_bike
    expect(released_bike.working?).to eq true
  end

  it "allows docking a bicycle" do
    bike = Bike.new
    @docking_station.dock(bike)
    expect(@docking_station.docked_bikes).not_to be_empty
  end

  it "raises an error if there are no bikes" do
    expect { @docking_station.release_bike }.to raise_error("There are no bikes")
  end

end
