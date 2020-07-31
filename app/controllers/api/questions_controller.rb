
  module Api
    class QuestionsController < ApplicationController
      def filter
        @result = QConcursos::QuestionsFetcher.perform(date_params)
        render json: { data: @result }
      rescue => e
        Rails.logger.warn("#{e}: #{e.backtrace.join "\n\t"}")
      end

      private

      def date_params
        json_params = JSON.parse(request.raw_post)
      end
    end
  end