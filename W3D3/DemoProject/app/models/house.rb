# == Schema Information
#
# Table name: houses
#
#  id         :integer          not null, primary key
#  address    :string           not null
#  created_at :datetime
#  updated_at :datetime
#

class House < ActiveRecord::Base

    validates :address, presence: true

    has_many :residents,
      class_name: :Person,
      primary_key: :id,
      foreign_key: :house_id

end
