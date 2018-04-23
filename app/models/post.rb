class Post < ApplicationRecord
    validates :user_id, {presence: true}
    validates :title, {presence: true, length: {maximum: 120}}
    validates :contents, {presence: true, length: {maximum: 1000}}
  
    def user
        return User.find_by(id: self.user_id)
    end
end
