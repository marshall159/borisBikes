require "docking_station"

describe DockingStation do

  it "creates new object of class DockingStation" do
    expect(subject).to be_instance_of(DockingStation)
  end

  describe "#release_bike" do
    it "releases a bike" do
      bikeDouble = double("Bike", :broken? => false)

      subject.dock(bikeDouble)

      expect(subject.release_bike).to eq(bikeDouble)
    end

    it "raises an error if there are no bikes" do
      expect { subject.release_bike }.to raise_error("There are no bikes")
    end
  end

  describe "#dock" do
    it { is_expected.to respond_to(:dock).with(1).argument }

    it "allows docking a bicycle" do
      bikeDouble = double("Bike")

      expect(subject.dock(bikeDouble)).to eq(bikeDouble)
    end
  
    it "returns docked bikes" do
      bikeDouble = double("Bike", :broken? => false)

      subject.dock(bikeDouble)
      
      expect(subject.release_bike).to equal(bikeDouble)
    end
  
    it "raises an error when full" do
      bikeDouble = double("Bike")

      subject.capacity.times { subject.dock(bikeDouble) }

      expect { subject.dock(bikeDouble) }.to raise_error("Docking Station Full")
    end
  end

  it "has a default capacity" do
    bikeDouble = double("Bike")

    described_class::DEFAULT_CAPACITY.times { subject.dock(bikeDouble) }

    expect(subject.capacity).to eq(DockingStation::DEFAULT_CAPACITY)
    expect { subject.dock(bikeDouble) }.to raise_error("Docking Station Full")
  end

  it "allows setting the capacity when cretaing a DockingStation" do
    bikeDouble = double("Bike")
    docking_station =  DockingStation.new(10)

    10.times { docking_station.dock(bikeDouble) }

    expect(docking_station.capacity).to eq(10)
    expect { docking_station.dock(bikeDouble) }.to raise_error("Docking Station Full")
  end


  context "when bike is broken and then docked" do
  
    it "does not release broken bike" do
      # expect{ @docking_station.release_bike }.to raise_error("Broken bike")
      bikeDoubleOne = double("BikeOne", :broken? => true)
      bikeDoubleTwo = double("BikeTwo", :broken? => false)
      
      subject.dock(bikeDoubleTwo)
      subject.dock(bikeDoubleOne)
      
      expect(subject.release_bike).not_to be_broken
    end
  end

end
