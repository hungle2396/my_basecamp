class AddCanDeleteToGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :can_delete, :boolean, default: false
  end
end
