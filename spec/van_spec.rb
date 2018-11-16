require 'van'

describe Van do
    let(:bike) { double("Bike") }

    it { is_expected.to respond_to(:collect).with(1).argument }

    it "is initially empty" do 
        expect(subject.storage).to be_empty
    end

    it "stores bikes" do 
        subject.collect(bike)

        expect(subject.storage).to include(bike)
    end

    it "delivers bikes" do
        subject.collect(bike)

        subject.deliver 

        expect(subject.storage).to be_empty
    end

end