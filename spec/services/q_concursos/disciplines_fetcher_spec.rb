# frozen_string_literal: true

require "spec_helper"

describe QConcursos::DisciplinesFetcher do
  describe ".perform" do
    it "makes a request to get disciplines" do
      response_body = File.read("spec/fixtures/questions.json")

      url = "https://raw.githubusercontent.com/qcx/desafio-backend/master/questions.json"
      request = stub_request(:get, url)
      .with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 
        'Host'=>'raw.githubusercontent.com', 'User-Agent'=>'Ruby'}).to_return(body: response_body, status: 200)

      args = {}
      described_class.perform(args)

      expect(request).to have_been_requested
    end
  end
end
