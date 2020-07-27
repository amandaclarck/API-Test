class QConcursosAdapter
  def self.get_questions
    args = parameters(action: "get", path: "question_access.json")
    repository_request(args)
  end

  def self.get_disciplines
    args = parameters(action: "get", path: "questions.json")
    repository_request(args)
  end

  def self.repository_request(args)
    QConcursosRepository.new(args).request
  end

  private

  def self.parameters(args)
    {
      action: args[:action],
      full_url: ENV["URL"] + args[:path]
    }
  end
end