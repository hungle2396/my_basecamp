class AddCanReadToGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :can_read, :boolean, default: false
  end
end
