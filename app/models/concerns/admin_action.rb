module AdminAction

  def has_access(params)
    admin_actions = %w[ ]
    if admin_actions.include?(params[:action])
      return true
    end
    false
  end


end