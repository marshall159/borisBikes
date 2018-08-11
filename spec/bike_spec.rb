require 'bike'

describe Bike do
  it "responds to method working?" do
    expect(subject).to respond_to(:working?)
  end

  it "allows reporting bike as broken" do
    expect(subject).to respond_to(:report_broken)
  end

  it "#broken? tells you if bike is broken, returns boolean" do
    expect(subject.broken?).to be false  
  end
end
