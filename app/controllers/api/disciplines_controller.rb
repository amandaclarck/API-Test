
module Api
  class DisciplinesController < ApplicationController
    def index
      result = QConcursos::DisciplinesFetcher.perform
      render json: {data: "OI"}
    rescue => e
      Rails.logger.warn("#{e}: #{e.backtrace.join "\n\t"}")
    end
  end
end