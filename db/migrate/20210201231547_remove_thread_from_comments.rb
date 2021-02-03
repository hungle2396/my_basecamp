class RemoveThreadFromComments < ActiveRecord::Migration[6.0]
  def change
    remove_reference :comments, :thread, null: false, foreign_key: true
  end
end
