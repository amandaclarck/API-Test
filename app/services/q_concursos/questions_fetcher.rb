module QConcursos
  class QuestionsFetcher
    def initialize(args = {})
      @adapter = QConcursosAdapter
    end

    attr_reader :adapter, :questions, :parsed_questions

    def self.perform(args = {})
      new(args).perform
    end

    def perform
      fetch_questions
      parse_questions
      year_number = 2020
      month_number = 6
      questions_per_year(year_number)

      # questions_per_month(year_number, month_number)
    end

    def fetch_questions
      return Rails.cache.fetch(@questions, :expires_in => 1.minutes){
        @questions = adapter.get_questions
      }
    end

    def parse_questions
      order = "DESC"

      @parsed_questions = questions.map do |question|
        {
          "question_id": question["question_id"],
          "date": question["date"],
          "times_accessed": question["times_accessed"]
        }
      end.sort_by { |question| order == "DESC" ? -question[:times_accessed].to_i : question[:times_accessed] }
    end

    def questions_per_week(week_number)
      
    end

    # def questions_per_month(month_number, year_number)
    #   if is_month(month_number) && is_year(year_number)
    #     parsed_questions.sort_by do |question|
    #       if (year_number.eql? DateTime.parse(question[:date]).year and
    #          month_number.eql? DateTime.parse(question[:date]).month)
    #         question
    #       end
    #     end
    #   else
    #     return {data: "No data"}
    #   end
    # end

    def questions_per_year(year_number)
      questions = []

      if is_year(year_number)
        questions = parsed_questions.map do |question| 
          if year_number == DateTime.parse(question[:date]).year
            question
          end
        end.reject(&:blank?)
        
        questions.sort_by { |question| -question[:times_accessed]}
      else
        return {data: "No data"}
      end
    end

    def is_month(month)
      month >= 1 && month <= 12 ? true : false
    end

    def is_year(year)
      year >= 1900 && year <= DateTime.now.year ? true : false
    end

    def is_day(day)
      day >= 1 && day <= 31 ? true : false
    end
  end
end