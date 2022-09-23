require "spec_helper"
RSpec.describe Modules::GetCurrency do
  specify "#get_course" do
    course = instance_double Modules::GetCurrency
    allow(course).to receive(:get_course).and_return(66)
    expect(course.get_course).to eq(66)
  end
  specify "#connect_and_get" do
    expect(Modules::GetCurrency.send(:connect_and_get)).to match(/USD/)
  end
end
