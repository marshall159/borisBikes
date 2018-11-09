require "docking_station"

describe DockingStation do

  it "creates new object of class DockingStation" do
    expect(subject).to be_instance_of(DockingStation)
  end

  it "responds to #release_bike" do
    expect(subject).to respond_to(:release_bike)
    # one liner syntax:
    # it { is_expected.to respond_to :release_bike }
  end

  it "releases a bike" do
    bike = subject.release_bike
    # subject.dock(bike)
    expect(bike).to be_instance_of(Bike)
  end

  it 'gets a working bike' do
    bike = subject.release_bike
    # subject.dock(bike)
    # released_bike = subject.release_bike
    expect(bike).to be_working
  end

  it "allows docking a bicycle" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.docked_bikes).to be_instance_of(Bike)
  end

#   it "raises an error if there are no bikes" do
#     expect { subject.release_bike }.to raise_error("There are no bikes")
#   end

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

#     it "will not accept more bikes than capacity" do
#       bike = Bike.new
#       expect { @full_dock.dock(bike) }.to raise_error("Dock Full")
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
