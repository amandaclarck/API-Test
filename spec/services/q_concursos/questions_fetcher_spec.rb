# frozen_string_literal: true

require "spec_helper"

describe QConcursos::QuestionsFetcher do
  describe ".perform" do
    it "makes a request to get questions" do
      response_body = File.read("spec/fixtures/question_access.json")

      url = "https://raw.githubusercontent.com/qcx/desafio-backend/master/question_access.json"
      request = stub_request(:get, url)
        .with(headers: {"Accept" => "*/*", "Accept-Encoding" => "gzip;q=1.0,deflate;q=0.6,identity;q=0.3",
                        "Host" => "raw.githubusercontent.com", "User-Agent" => "Ruby"}).to_return(body: response_body, status: 200)

      args = {}
      described_class.perform(args)

      expect(request).to have_been_requested
    end
  end
end
