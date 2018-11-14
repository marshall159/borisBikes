require 'van'

describe Van do
    it { is_expected.to respond_to(:collect).with(1).argument }


end