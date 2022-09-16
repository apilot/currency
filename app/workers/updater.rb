class Updater
  @queue = :updater_worker_queue
  def self.perform(currency)
    Settings::UpdateService.call(currency: currency)
  end
end
