class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :user, :coin
end
