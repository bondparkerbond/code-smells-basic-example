class Owner < ActiveRecord::Base
  has_many :cats

  def update_cats(name, age, fur_color, ec, ft, update_food = false)
    self.cats.each do |cat|
      cat.name = name
      cat.age = age
      cat.fur_color = fur_color
      cat.eye_color = ec
      cat.food_type = ft
      cat.save
    end
  end
end
