# frozen_string_literal: true

require "spec_helper"

describe QConcursosRepository do
  describe ".new" do
    it "initializes the given class" do
      allow(QConcursosRepository).to receive(:new).with(args: {})

      described_class.new({args: {}})
      
      expect(QConcursosRepository).to have_received(:new).with(args: {})
    end
  end
end
