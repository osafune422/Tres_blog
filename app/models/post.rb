class Post < ApplicationRecord
    validates :user_id, {presence: true}
    validates :title, {presence: true, length: {maximum: 100}}
    validates :contents, {presence: true, length: {maximum: 800, minimum: 5}}
  
    def user
        return User.find_by(id: self.user_id)
    end
end
