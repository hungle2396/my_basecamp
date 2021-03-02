class Task < ApplicationRecord
    validates :description, presence: true, length: { minimum: 5, maximum: 50 }

    belongs_to :project
end