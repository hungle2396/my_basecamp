class Discussion < ApplicationRecord
    validates :title, presence: true, length: { minimum: 3, maximum: 25 }
    validates_uniqueness_of :name

    validates :description, presence: true, length: { minimum: 10, maximum: 50 }
end