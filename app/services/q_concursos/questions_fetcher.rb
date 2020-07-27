module QConcursos
  class QuestionsFetcher
    def initialize(args = {})
      @adapter = QConcursosAdapter
    end

    attr_reader :adapter, :questions

    def self.perform(args = {})
      new(args).perform
    end

    def perform
      fetch_questions
      parse_questions
    end

    def fetch_questions
      return Rails.cache.fetch(@questions, :expires_in => 10.minutes){
        @questions = adapter.get_questions
      }
    end

    def parse_questions
      order = "DESC"

      questions.map do |question|
        {
          "question_id": question["question_id"],
          "date": question["date"],
          "times_accessed": question["times_accessed"]
        }
      end.sort_by { |question| order == "DESC" ? -question[:times_accessed].to_i : question[:times_accessed] }
    end
  end
end