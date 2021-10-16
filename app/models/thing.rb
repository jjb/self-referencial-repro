class Thing < ApplicationRecord
  belongs_to :thing, required: false#, inverse_of: :things
  has_many :things#, inverse_of: :thing
end
