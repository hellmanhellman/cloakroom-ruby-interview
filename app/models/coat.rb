class Coat < ApplicationRecord
  has_many :coat_orders

  def to_s
    name
  end

end