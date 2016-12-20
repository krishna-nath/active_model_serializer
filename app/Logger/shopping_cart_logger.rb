class ShoppingCartLogger < Logger

  def format_message(severity, timestamp, msg)
    "#{timestamp.to_formatted_s(:db)} #{severity} #{msg}\n"
  end


end

