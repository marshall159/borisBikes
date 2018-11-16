require 'garage'

describe Garage do
    let(:bike) { double("Bike") }

    it { is_expected.to respond_to(:collect).with(1).argument }

    it "is initially empty" do 
        expect(subject.storage).to be_empty
    end

    it "stores bikes" do
        subject.collect(bike)

        expect(subject.storage).to include(bike)
    end

    it "repairs bikes" do 
        expect(bike).to receive(:repair)

        subject.collect(bike)
        
        subject.repair_bikes
    end
end