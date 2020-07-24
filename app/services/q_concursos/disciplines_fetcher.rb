module QConcursos
  class DisciplinesFetcher
    def initialize(args)
      @args = args
      @adapter = QConcursosAdapter
    end

    attr_reader :adapter

    def self.perform(args)
      new(args).perform
    end

    def perform
    end

    def fetch_disciplines
      @disciplines = adapter.get_disciplines
    end
  end
end