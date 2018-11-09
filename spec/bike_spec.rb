require 'bike'

describe Bike do
  it "creates new object of class Bike" do
    expect(subject).to be_instance_of(Bike)
  end

  it "responds to #working?" do
    expect(subject).to respond_to(:working?)
  end

  it "can be reported as broken" do
    subject.report_broken
    expect(subject).not_to be_working
  end

  it "is not broken initially" do
    expect(subject).to be_working
  end

#   # it "#broken? tells you if bike is broken, returns boolean" do
#   #   expect(subject.broken?).to be false
#   # end

#   context "bike is reported broken" do
#     before(:context) do
#       @bike = Bike.new
#       @bike.report_broken
#     end

#     it "#broken? returns true" do
#       expect(@bike.broken?).to be true
#     end

#   end



end
