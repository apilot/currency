require "rails_helper"

RSpec.describe Setting, type: :model do
  it "add currensy on setting" do
    date = Time.current
    Setting.create!(course: 55, date_to: date)
    setting = Setting.all.last
    expect(setting.course).to eq("55")
  end
end
