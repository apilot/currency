class PagesController < ApplicationController
  def stimulus
    @currency = if Setting.all.last&.date_to&.> Time.current
      Setting.all.last.course
    else
      Modules::GetCurrency.get_course
    end
  end
end
