class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :roster, :points, :user_id
  has_many :users
end
