module UserAction

  def has_access?(params)

    user_actions = %w[get_products add_to_cart login logout signup delete_from_cart add_user_profile_pic]
    if user_actions.include?(params[:action])
     return true
    end
   false
  end
end