class AddDiscussionToComments < ActiveRecord::Migration[6.0]
  def change
    add_reference :comments, :discussion, null: false, foreign_key: true
  end
end
