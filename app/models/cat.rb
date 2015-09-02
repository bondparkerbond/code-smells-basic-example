class Cat < ActiveRecord::Base
  belongs_to :owners

  def full_details(show_all = true)
    "#{self.name} - #{self.age}"
  end

  def owner_details
    "#{self.owner.name} - #{self.owner.age}"
  end
end
