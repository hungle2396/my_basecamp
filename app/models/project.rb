class Project < ApplicationRecord
    #belongs_to :user
    validates :title, presence: true, length: { minimum: 3, maximum: 30 }
    validates_uniqueness_of :title

    validates :description, presence: true, length: { minimum: 10, maximum: 50 }

    has_many :groups, dependent: :destroy
    has_many :users, through: :groups
end