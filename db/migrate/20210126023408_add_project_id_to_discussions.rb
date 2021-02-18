class AddProjectIdToDiscussions < ActiveRecord::Migration[6.0]
  def change
    add_column :discussions, :project_id, :integer
  end
end
