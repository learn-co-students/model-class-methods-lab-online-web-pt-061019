class Classification < ActiveRecord::Base
  has_many :boat_classifications
  has_many :boats, through: :boat_classifications

  def self.my_all
    # all
    self.all
  end

  def self.longest
    # Boat.longest.classifications
    # binding.pry
    Boat.longest.classifications
    # Boat.longest.first.classifications if .longest self.order(length: :desc).limit(1)
  end

end
