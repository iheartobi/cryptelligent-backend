class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :roster, :points
  has_many :users
end
