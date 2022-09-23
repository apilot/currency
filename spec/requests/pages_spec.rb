require "rails_helper"

RSpec.describe "Pages", type: :request do
  describe "GET /" do
    it "root go to pages#stimulus" do
      get "/"
      expect(response).to render_template(:stimulus)
    end
  end
end
