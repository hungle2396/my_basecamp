class AddCanUpdateToGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :can_update, :boolean, default: false
  end
end
