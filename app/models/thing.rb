class Thing < ApplicationRecord
  belongs_to :thing, required: false
  has_many :things
end
