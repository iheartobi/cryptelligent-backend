class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username,  :email, :img_url, :bg_url, :coinbank, :active
end
