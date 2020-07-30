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
      return Rails.cache.fetch(@disciplines, :expires_in => 10.minutes){
        @disciplines = adapter.get_disciplines
      }
    end

    def parse_disciplines
      order = "DESC"

      disciplines_array = disciplines.map do |discipline|
        date = discipline["created_at"]

        if DateTime.parse(date).between?(24.hours.ago, Time.now)
          {
            "id": discipline["id"],
            "statement": discipline["statement"],
            "text": discipline["text"],
            "answer": discipline["answer"],
            "daily_access": discipline["daily_access"],
            "discipline": discipline["discipline"],
            "created_at": date
          }
        end
      end.reject(&:blank?)
      
      if !disciplines_array.blank?
        return disciplines_array.sort_by { |discipline| order == "DESC" ? -discipline[:daily_access].to_i 
          : discipline[:daily_access] }
      else
        return {data: "No data"}
      end
    end
  end
end