require "boris_bikes"

describe DockingStation do

  before do
    @docking_station = DockingStation.new
  end

  it "creates new object of class DockingStation" do
    expect(@docking_station.class).to eq DockingStation
  end

  it { is_expected.to respond_to(:release_bike) }

end
