class Project < ApplicationRecord
    #belongs_to :user
    has_many :groups, dependent: :destroy
    has_many :users, through: :groups
end