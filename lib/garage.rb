class Garage
    attr_reader :storage 

    def initialize
        @storage = []
    end

    def collect(bike)
        storage << bike 
    end
end