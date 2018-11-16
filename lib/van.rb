class Van
    attr_reader :storage

    def initialize 
        @storage = []
    end
    

    def collect(bike)
        @storage << bike
    end

    def deliver 
        storage.pop
    end
end