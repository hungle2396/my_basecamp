class Discussion < ApplicationRecord
    validates :title, presence: true, length: { minimum: 1, maximum: 30 }
    validates_uniqueness_of :title

    validates :description, presence: true, length: { minimum: 10, maximum: 50 }

    belongs_to :project
    has_many :comments, dependent: :destroy
end