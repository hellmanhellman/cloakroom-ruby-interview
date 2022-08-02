class CoatOrder < ApplicationRecord
  belongs_to :coat
  enum status: [ :created, :packaging, :shipped, :cancelled ]
end