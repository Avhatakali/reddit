class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, :weblink, presence: true,
                    length: { minimum: 4 }

   paginates_per 2
end
