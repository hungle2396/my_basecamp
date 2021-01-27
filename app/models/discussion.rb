class Discussion < ApplicationRecord
    validates :title, presence: true, length: { minimum: 3, maximum: 30 }
    validates_uniqueness_of :title

    validates :description, presence: true, length: { minimum: 10, maximum: 50 }

    belongs_to :project
end