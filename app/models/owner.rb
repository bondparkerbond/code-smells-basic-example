class Owner < ActiveRecord::Base
  has_many :cats

  def full_details
    "#{self.name} - #{self.age}"
  end

  # def owner_details
  #   "#{self.owner.name} - #{self.owner.age}"
  # end
end
