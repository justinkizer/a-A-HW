# == Schema Information
#
# Table name: people
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  house_id   :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Person < ActiveRecord::Base

  validates :name, :house_id, presence: true

  belongs_to :house,
    class_name: :House,
    primary_key: :id,
    foreign_key: :house_id

end
