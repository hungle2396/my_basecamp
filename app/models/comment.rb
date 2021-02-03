class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :discussion

  validates :body, presence: true, allow_blanck: false
end




