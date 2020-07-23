module QConcursos
  class DisciplinesFetcher
    def initialize(args)
      @args = args
    end

    def self.perform(args)
      new(args).perform
    end

    def perform
    end
  end
end