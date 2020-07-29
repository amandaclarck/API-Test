module QConcursos
  class QuestionsFetcher
    def initialize(args = {})
      @adapter = QConcursosAdapter
      @params_date = {year: "2020", month: "07", day: "13"}
    end

    attr_reader :adapter, :questions, :parsed_questions, :params_date

    def self.perform(args = {})
      new(args).perform
    end

    def perform
      fetch_questions
      parse_questions
      filtered_questions
    end

    def fetch_questions
      return Rails.cache.fetch(@questions, :expires_in => 2.minutes){
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

    def filtered_questions
      year = params_date[:year].to_i
      month = params_date[:month].to_i
      day = params_date[:day].to_i
      is_month_is_year = is_month(month) && is_year(year)

      if is_day(day) && is_month_is_year
        full_date = Time.parse([year, month, day].join("-"))
        start_date = full_date.beginning_of_week
        end_date = full_date.end_of_week
        
        questions = parsed_questions[10..20].map do |question|
          date = parsed_date(question[:date])
          if (date >= start_date or date <= end_date)
            question
          end
        end
      elsif is_month_is_year
        questions = parsed_questions[10..20].map do |question|
          date = parsed_date(question[:date])
          
          if (year.eql? date.year and month.eql? date.month)
            question
          end
        end
      elsif is_year(year)
        questions = parsed_questions[10..20].map do |question|
          if year == parsed_date(question[:date]).year
            question
          end
        end
      else 
        { data: "No data"} 
      end
      
      unless questions.blank?
        questions.reject(&:blank?).sort_by { |question| -question[:times_accessed]}
      end
    end

    def parsed_date(date)
      DateTime.parse(date)
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