module ApplicationHelper
  def logged_in?
    session[:user_id]
  end

  def family_playdates
    @family.children.each do |child|
      if child.playdates.any?
        child.playdates.each do |playdate|
        link_to playdate.name, playdate_path(playdate.id)
      end
    end
      return "you are a friendless Yankee fan."
    end
  end


  def family_id
    user = User.find(session[:user_id])
    user.family.id
  end

end
