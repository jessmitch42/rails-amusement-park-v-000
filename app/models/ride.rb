class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if !self.user.has_enough_tickets?(self.attraction) && !self.user.is_tall_enough?(self.attraction)
      "Sorry. You do not have enough tickets to ride the Roller Coaster. You are not tall enough to ride the Roller Coaster."
    elsif !self.user.has_enough_tickets?(self.attraction)
      "Sorry. You do not have enough tickets to ride the Roller Coaster."
    elsif !self.user.is_tall_enough?(self.attraction)
      "Sorry. You are not tall enough to ride the Roller Coaster."
    else
      self.user.update_user_after_ride(self.attraction)
    end
  end

  # def attraction_tickets
  #   self.attraction.tickets
  # end
  #
  # def user_tickets
  #   self.user.tickets
  # end
end
