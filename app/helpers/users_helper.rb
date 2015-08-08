module UsersHelper

  def is_admin
    if current_user
      if current_user.admin
        true
      else
        false
      end
    else
      false
    end
  end

end
