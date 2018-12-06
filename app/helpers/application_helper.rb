module ApplicationHelper
  def logged_in?
    session[:user_id]
  end

  def my_children
    current_user.family.children
  end

  def family_id
    user = User.find(session[:user_id])
    user.family.id
  end

end
