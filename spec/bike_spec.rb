require 'bike'

describe Bike do
  it "responds to method working?" do
    expect(subject).to respond_to(:working?)
  end

  it "bike can be reported as broken" do
    subject.report_broken
    expect(subject).to be_broken
  end

  # it "#broken? tells you if bike is broken, returns boolean" do
  #   expect(subject.broken?).to be false
  # end

  context "bike is reported broken" do
    before(:context) do
      @bike = Bike.new
      @bike.report_broken
    end

    it "#broken? returns true" do
      expect(@bike.broken?).to be true
    end

  end



end
