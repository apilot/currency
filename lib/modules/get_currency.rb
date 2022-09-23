module Modules
  module GetCurrency
    require "net/http"
    require "open-uri"
    @source = "https://www.cbr-xml-daily.ru/daily_json.js"
    @current = 0.0
    extend self
    def get_course
      parse_data(connect_and_get)
      @source["Valute"]["USD"]["Value"]
    end

    private

    def connect_and_get
      resp = Net::HTTP.get_response(URI.parse(@source))
      data = resp.body
    end

    def parse_data(data)
      @source = JSON.parse(data)
    end
  end
end
