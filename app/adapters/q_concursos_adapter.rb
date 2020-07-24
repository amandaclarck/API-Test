class QConcursosAdapter
  def initialize(args)
    @repository = QConcursosRepository.new
  end

  attr_reader :repository

  def self.get_questions
    parameters("question_access.json")
    repository(args).request
  end

  def self.get_disciplines
    parameters("questions.json")
    repository(args).request
  end

  private
  def parameters(path)
    {
      full_url: "https://raw.githubusercontent.com/qcx/desafio-backend/master/" + path
    }
  end
end