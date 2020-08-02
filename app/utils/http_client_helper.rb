# frozen_string_literal: true

require "net/https"

module HttpClientHelper
  CONTENT_TYPE_HASH = {
    xml: "text/xml",
    json: "application/json"
  }.freeze

  def self.get(args)
    uri = URI(args[:url])
    req = Net::HTTP::Get.new(uri)

    Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == "https") { |http|
      http.request(req)
    }
  end
end
