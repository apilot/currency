class Admin::SettingController < AdminController
  def currency
    @settings = Setting.all.last
    @course = @settings&.course
    @date_to = @settings&.date_to
  end

  def create_course
    success, @setting = Settings::CreateService.call setting_params
    if success
      flash.now[:success] = t(".course_added")
    else
      render "admin/currency"
    end
  end

  def edit
  end

  private

  def setting_params
    params.require(:setting).permit(:course, :date_to)
  end
end
