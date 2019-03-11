class Post < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  validates :title, :weblink, presence: true,
                    length: { minimum: 4 }
end
