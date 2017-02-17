module Toyable
  extend ActiveSupport::Concern

  included do
    has_many :toys, as: :toyable
  end

  def receive_toy(name)
    toy = Toy.find_by(name: name)
    if toy
      self.toys = self.toys + [toy]
    else
      self.toys = self.toys + [Toy.new(name: name)]
    end
  end
end
