RSpec.describe "GetCurrency" do
  let(:uri) { URI('https://test.com/return_json/reviews.json') }
  let(:data) { {"reviews" => [{"Valute" => { "USD" => {"value" => 60.2 } }, "data2"=> "2"}]} }
  require_relative "../../../lib/modules/get_currency"
  it "return data from url" do
    data = GetCurrency.get_course
    data
  end
end
