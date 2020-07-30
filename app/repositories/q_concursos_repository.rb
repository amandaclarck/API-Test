class QConcursosRepository
  def initialize(args)
    @action = args[:action]
    @full_url = args[:full_url]
  end

  attr_reader :action, :full_url, :response

  def request
    if action.eql? "get"
      @response = HTTPClient.get(url: full_url)
    end

    parse_response
  end

  private

  def parse_response
    JSON.parse response.body
  end
end