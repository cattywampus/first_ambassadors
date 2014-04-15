class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :starts_at
      t.datetime :ends_at
      t.datetime :ambassador_schedule_starts_at
      t.datetime :ambassador_schedule_ends_at

      t.timestamps
    end

    add_column :student_ambassadors, :event_id, :integer

    add_index :student_ambassadors, :event_id
  end
end
