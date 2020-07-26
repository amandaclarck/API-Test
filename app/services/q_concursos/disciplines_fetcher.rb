module QConcursos
  class DisciplinesFetcher
    def initialize(args = {})
      @adapter = QConcursosAdapter
    end

    attr_reader :adapter, :disciplines

    def self.perform(args = {})
      new(args).perform
    end

    def perform
      fetch_disciplines
      parse_disciplines
    end

    def fetch_disciplines
      @disciplines = adapter.get_disciplines
    end

    def parse_disciplines
      order = "DESC"

      dates = disciplines[10..20].map do |discipline|
        {
          "id": discipline["id"],
          # "statement": discipline["statement"],
          # "text": discipline["text"],
          # "answer": discipline["answer"],
          "daily_access": discipline["daily_access"],
          "discipline": discipline["discipline"],
          "created_at": discipline["created_at"]
        }
      end
      dates.sort_by { |date| order == "DESC" ? -date[:created_at].to_i : date[:created_at] }
      # d.sort! { |discipline| DateTime.parse(discipline[:created_at]) <=> DateTime.parse(discipline[:created_at]) }

      # d.sort_by{ |discipline| discipline["created_at"] if !discipline["created_at"].blank? }

      #parsear a resposta para hash
      #parsear a data para datetime
      #organizar pelas últimas 24 horas
      #organizar pelo daily_access maior
      #não deixar bater mais que 1 vez por minuto
    end
  end
end