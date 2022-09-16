module Settings
  class CreateService < ::ApplicationService
    def initialize(params)
      super
      @params = params
      @name_job = "real_currency"
    end

    def call
      tx_and_commit do
        @setting = Setting.new @params
        @setting.save
      end
      [@setting.errors.none?, @setting]
    end

    private

    def post_call
      broadcast_later "currency_course",
        "pages/created",
        locals: {currency: @setting.course}
      resque_jobs(date_to: @setting.date_to)
    end

    def resque_jobs(date_to:)
      date = (date_to - Time.current).round
      success = Resque.remove_schedule(@name_job)
      if success
        config = {
          class: "Updater",
          every: ["120s", {first_in: date}],
          args: {currency: 33},
          presist: true
        }
        Resque.set_schedule(@name_job, config)
      end
    end
  end
end
