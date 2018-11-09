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
      expect(subject.bikes.last).to equal(bike)
    end
  
    it "raises an error when full" do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock(Bike.new) }
      expect { subject.dock(Bike.new) }.to raise_error("Docking Station Full")
    end
  end

  # it 'gets a working bike' do
  #   bike = subject.release_bike
  #   # subject.dock(bike)
  #   # released_bike = subject.release_bike
  #   expect(bike).to be_working
  # end


#   it "sets default a capacity when no arguments passed" do
#     expect(subject.capacity).to eq(DockingStation::DEFAULT_CAPACITY)
#   end

#   context do
#     it "allows setting the capacity when cretaing a DockingStation" do
#       dock =  DockingStation.new(10)
#       expect(dock.capacity).to eq(10)
#     end
#   end

#   context "when dock is full" do
#     before(:context) do
#       @full_dock = DockingStation.new
#       DockingStation::DEFAULT_CAPACITY.times { @full_dock.dock(Bike.new) }
#     end

#   end

#   # context "when bike is broken and then docked" do
#   #   before(:context) do
#   #     @bike = Bike.new
#   #     @docking_station = DockingStation.new
#   #     @bike.report_broken
#   #     @docking_station.dock(@bike)
#   #   end
#   #
#   #   it "does not release broken bike" do
#   #     expect{ @docking_station.release_bike }.to raise_error("Broken bike")
#   #   end
#   # end

end
