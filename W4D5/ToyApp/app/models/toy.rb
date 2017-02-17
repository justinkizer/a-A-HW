class Toy < ActiveRecord::Base

  validates :name, uniqueness: { scope: :toyable, message: "An Owner's toys cannot have the same name"}

  belongs_to :toyable, polymorphic: true

end
