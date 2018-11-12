module ApplicationHelper
  def logged_in?
    session[:user_id]
  end

  def family_playdates
    @family.children.each do |child|
      child.playdates.each do |playdate|
       return link_to playdate.name, playdate_path(playdate.id)
      end
    end
  end

  def family_id
    binding.pry
    user = User.find(session[:user_id])
    user.family.id
  end

end
