class AddCanWriteToGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :can_write, :boolean, default: false
  end
end
