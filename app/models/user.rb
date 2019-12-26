class User < ApplicationRecord
    has_secure_password
    validates :name, presence: :true
    validates :name, length: { minimum: 2 }
    validates :username, presence: :true
    validates :username, uniqueness: { case_sensitive: false}

    validates :email, presence: :true
    validates :email, uniqueness: { case_sensitive: false}

    validates :active, inclusion: { in: [true, false] }



end
