class Group < ApplicationRecord
  belongs_to :user
  belongs_to :project

  def create_group(project, user)

  end
end
