class QConcursosRepository
  def initialize(args)
    @action = args[:action]
    @full_url = args[:full_url]
  end

  attr_reader :action, :full_url

  def request
    if action.eql? "get"
      HTTPClient.get(url: full_url)
    else
    end
  end
end