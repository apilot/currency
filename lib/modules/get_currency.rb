module GetCurrency
  require "net/http"
  require "open-uri"
  @source = "https://www.cbr-xml-daily.ru/daily_json.js"
  @current = 0.0

  def self.get_course
    resp = Net::HTTP.get_response(URI.parse(@source))
    data = resp.body
    source = JSON.parse(data)
    source["Valute"]["USD"]["Value"]
  end
end
