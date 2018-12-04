module PlaydatesHelper

  def today
    current_user.family.children.each do |child|
      child.playdates.each do |playdate|   
        if playdate.datetime.today?
          "Todays Playdates"
          link_to playdate.name, playdate_path(playdate.id)
        else 
          return "#{child.name} does not have a play date today"
        end
      end
    end
  end
end
