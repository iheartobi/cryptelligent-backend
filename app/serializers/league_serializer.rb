class LeagueSerializer < ActiveModel::Serializer
  attributes :id, :name, :tier, :win_amount
  has_many :teams
end
