require "docking_station"

describe DockingStation do

  before(:example) do
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
    expect(released_bike).to be_working
  end

  it "allows docking a bicycle" do
    bike = Bike.new
    @docking_station.dock(bike)
    expect(@docking_station.docked_bikes).not_to be_empty
  end

  it "raises an error if there are no bikes" do
    expect { @docking_station.release_bike }.to raise_error("There are no bikes")
  end

  it "sets default a capacity when no arguments passed" do
    expect(@docking_station.capacity).to eq(DockingStation::DEFAULT_CAPACITY)
  end

  subject { DockingStation.new(10) }

  it "allows setting the capacity when cretaing a DockingStation" do
    expect(subject.capacity).to eq(10)
  end

  it "allows reporting a bike as broken once returned" do
    bike = Bike.new
    expect(@docking_station).to respond_to(:dock_broken_bike).with(1).argument
  end


  context "when dock is full" do
    before(:context) do
      @full_dock = DockingStation.new
      DockingStation::DEFAULT_CAPACITY.times { @full_dock.dock(Bike.new) }
    end

    it "will not accept more bikes than capacity" do
      bike = Bike.new
      expect { @full_dock.dock(bike) }.to raise_error("Dock Full")
    end
  end

end
