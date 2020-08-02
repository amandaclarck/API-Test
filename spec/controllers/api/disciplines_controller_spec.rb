# frozen_string_literal: true

require "spec_helper"
require "rails_helper"

describe Api::DisciplinesController, type: :controller do
  describe "GET /disciplines" do
    it "lists the disciplines most accessed in 24 hours" do
      stub_request(:get, "/api/disciplines/").to_return(status: 200)

      allow(QConcursos::DisciplinesFetcher).to receive(:perform)
      
      get :index

      expect(QConcursos::DisciplinesFetcher).to have_received(:perform)
    end
  end
end