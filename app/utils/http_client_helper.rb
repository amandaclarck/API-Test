# frozen_string_literal: true

require "net/https"

module HttpClientHelper
  CONTENT_TYPE_HASH = {
    xml: "text/xml",
    json: "application/json"
  }.freeze

  def self.put(args)
    uri = URI.parse(args[:url])

    request = Net::HTTP::Put.new(uri.request_uri)
    request.body = args[:body]
    request["Content-Type"] = CONTENT_TYPE_HASH[args[:content_type]]
    
    args[:headers]&.each do |header, value|
      request[header] = value
    end

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = (uri.scheme == "https")
    Rails.logger.info("HTTP PUT Request: #{uri} - #{request.body}")
    response = http.request(request)
    Rails.logger.info("HTTP PUT Response: #{response.code} - #{response.body}")
    response
  end

  def self.post(args)
    uri = URI.parse(args[:url])

    request = Net::HTTP::Post.new(uri.path)
    request.body = args[:body]
    request["Content-Type"] = CONTENT_TYPE_HASH[args[:content_type]]

    unless args[:headers].blank?
      args[:headers]&.each do |header, value|
        request[header] = value
      end
    end

    http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = (uri.scheme == "https")

    Rails.logger.info("HTTP POST Request: #{uri} - #{request.body} | Headers: #{request.to_hash.inspect}")
    response = http.request(request)
    Rails.logger.info("HTTP POST Response: #{response.code} - #{response.body}")
    response
  end

  def self.get(args)
    uri = URI(args[:url])
    req = Net::HTTP::Get.new(uri)
    
    res = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') {|http|
      http.request(req)
    }
  end
end
