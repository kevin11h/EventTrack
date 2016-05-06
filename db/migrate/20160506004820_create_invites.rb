class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.integer :attendee_id
      t.integer :attended_event_id
      t.timestamps null: false
    end
    add_foreign_key :invites, :users, column: :attendee_id
    add_foreign_key :invites, :events, column: :attended_event_id 
  end
end
