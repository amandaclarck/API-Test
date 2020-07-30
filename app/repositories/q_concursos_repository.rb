class QConcursosRepository
  def initialize(args)
    @action = args[:action]
    @full_url = args[:full_url]
  end

  attr_reader :action, :full_url, :response

  def request
    if action.eql? "get"
      @response = HttpClientHelper.get(url: full_url, content_type: :json)
    end

    parse_response
  end

  private

  def parse_response
    JSON.parse response.body
  end
end