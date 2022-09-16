class UpdaterStatic
  @queue = :updater_worker_queue_static
  def self.perform(currency)
    Settings::UpdateService.call(currency: currency) if Setting.all.last.date_to < Time.current
  end
end
