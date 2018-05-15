class Post < ApplicationRecord
    belongs_to :user
    
    validates :user_id, {presence: true}
    validates :title, {presence: true, length: {maximum: 100}}
    validates :contents, {presence: true, length: {maximum: 800, minimum: 5}}
  
end
