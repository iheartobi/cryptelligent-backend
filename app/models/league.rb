class League < ApplicationRecord
    has_many :teams
    has_many :users, through: :teams
end
