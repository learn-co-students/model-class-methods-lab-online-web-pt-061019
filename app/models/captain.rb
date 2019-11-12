class Captain < ActiveRecord::Base
  has_many :boats

  def self.catamaran_operators
    includes(boats: :classifications).where(classifications: {name: "Catamaran"})
  end

  def self.sailors
    includes(boats: :classifications).where(classifications: {name: "Sailboat"}).distinct
    #.distinct : returns unique captains
  end

  def self.motorboat_operators
    includes(boats: :classifications).where(classifications: {name: "Motorboat"})
  end

  def self.talented_seafarers
    # where("id IN (?)", self.sailors.pluck(:id) & self.motorboat_operators.pluck(:id))
    # binding.pry
    self.where(id: self.sailors.pluck(:id) & self.motorboat_operators.pluck(:id))
  end

  def self.non_sailors
    # binding.pry
    # where.not("id IN (?)", self.sailors.pluck(:id))
    self.where.not(id: self.sailors.pluck(:id))
  end

end

#pluck > https://guides.rubyonrails.org/active_record_querying.html#pluck