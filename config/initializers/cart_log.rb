# if Rails.configuration.active['debug_log']
# Rails.logger = Logger.new(File.join(Rails.root, 'log', 'cart_log.log'))
  # Delayed::Worker.logger                  = Logger.new(File.join(Rails.root, 'log', 'cart_log.log'))
# end


logfile = File.open("#{Rails.root}/log/ShoppingCartLog.log", 'a')
logfile.sync = true
CART_LOGGER = ShoppingCartLogger.new(logfile)