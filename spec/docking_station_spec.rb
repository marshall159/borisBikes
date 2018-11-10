require "docking_station"

describe DockingStation do

  it "creates new object of class DockingStation" do
    expect(subject).to be_instance_of(DockingStation)
  end

  describe "#release_bike" do
    it "releases a bike" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq(bike)
    end

    it "raises an error if there are no bikes" do
      expect { subject.release_bike }.to raise_error("There are no bikes")
    end
  end

  describe "#dock" do
    it { is_expected.to respond_to(:dock).with(1).argument }

    it "allows docking a bicycle" do
      bike = Bike.new
      # subject.dock(bike)
      expect(subject.dock(bike)).to eq(bike)
    end
  
    it "returns docked bikes" do
      bike = Bike.new

      subject.dock(bike)
      
      expect(subject.release_bike).to equal(bike)
    end
  
    it "raises an error when full" do
      subject.capacity.times { subject.dock(Bike.new) }
      expect { subject.dock(Bike.new) }.to raise_error("Docking Station Full")
    end
  end

  it "has a default capacity" do
    described_class::DEFAULT_CAPACITY.times { subject.dock(Bike.new) }

    expect(subject.capacity).to eq(DockingStation::DEFAULT_CAPACITY)
    expect { subject.dock(Bike.new) }.to raise_error("Docking Station Full")
  end

  it "allows setting the capacity when cretaing a DockingStation" do
    docking_station =  DockingStation.new(10)

    10.times { docking_station.dock(Bike.new) }

    expect(docking_station.capacity).to eq(10)
    expect { docking_station.dock(Bike.new) }.to raise_error("Docking Station Full")
  end


  context "when bike is broken and then docked" do
    before(:context) do
      @bike_one = Bike.new
      @bike_two = Bike.new
      @docking_station = DockingStation.new
      @docking_station.dock(@bike_one)
      @bike_two.report_broken
      @docking_station.dock(@bike_two)
    end
  
    it "does not release broken bike" do
      # expect{ @docking_station.release_bike }.to raise_error("Broken bike")
      expect(@docking_station.release_bike).to eq(@bike_one)
    end
  end

end
