class AddForeignKeyToEvents < ActiveRecord::Migration
  def change
    add_foreign_key :articles, :users, column: :creator_id
  end
end
