class Coin < ApplicationRecord
    has_and_belongs_to_many :teams
end
