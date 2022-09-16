module Settings
  class UpdateService < ::ApplicationService
    def initialize(params)
      super
      @params = params
    end

    def call
      @currency = GetCurrency.get_course
      broadcast_later "currency_course",
        "pages/created",
        locals: {currency: @currency}
    end
  end
end
