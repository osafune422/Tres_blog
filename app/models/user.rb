class User < ApplicationRecord
    has_secure_password
    has_many :posts
    
    # nameのエラー条件
    validates :name, {presence: true}
    # login_idのエラー条件
    validates :login_id, {presence: true, uniqueness: true}
end
