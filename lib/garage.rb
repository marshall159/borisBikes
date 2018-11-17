class Garage
    attr_reader :storage 

    def initialize
        @storage = []
    end

    def collect(bike)
        storage << bike 
    end

    def release 
        storage.pop
    end

    def repair_bikes
        storage.each { |bike| bike.repair }
    end
end