# frozen_string_literal: true

module Api
  class DisciplinesController < ApplicationController
    def index
      @result = QConcursos::DisciplinesFetcher.perform
      render json: {data: @result, status: :ok}
    rescue => e
      Rails.logger.warn("#{e}: #{e.backtrace.join "\n\t"}")
    end
  end
end
