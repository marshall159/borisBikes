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
    
    expect(subject).to be_broken 
  end

  it "is not broken initially" do
    expect(subject.broken?).to eq(false)
  end

end
