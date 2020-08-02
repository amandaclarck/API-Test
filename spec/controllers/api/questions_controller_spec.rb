# frozen_string_literal: true

require "spec_helper"
require "rails_helper"

describe Api::QuestionsController, type: :controller do
  describe "POST /filter" do
    it "lists the questions most accessed" do
      params = {body: {"year": "2020"}}

      stub_request(:post, "/api/questions/filter").with(params)
        .to_return(status: 200)

      allow(QConcursos::QuestionsFetcher).to receive(:perform).with(args: params)

      obj = double(QConcursos::QuestionsFetcher.perform(args: params))

      expect(QConcursos::QuestionsFetcher).to have_received(:perform).with(args: params)
    end
  end
end
