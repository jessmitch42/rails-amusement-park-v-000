class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    self.nausea > self.happiness ? "sad" : "happy"
  end

  def has_enough_tickets?(attraction)
    # "Sorry. You do not have enough tickets to ride the Roller Coaster."
    # compare attraction's required tickets to user intance's current ticket total
    attraction.tickets <= self.tickets
  end

  def is_tall_enough?(attraction)
    # "You are not tall enough to ride the Roller Coaster."
    # compare attraction's min height to user intance's height
    attraction.min_height <= self.height
  end

  def update_user_after_ride(attraction)
    self.tickets = self.tickets - attraction.tickets
    self.nausea = self.nausea + attraction.nausea_rating
    self.happiness = self.happiness + attraction.happiness_rating
    self.save
  end

end
