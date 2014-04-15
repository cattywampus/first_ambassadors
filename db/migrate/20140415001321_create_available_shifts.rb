class CreateAvailableShifts < ActiveRecord::Migration
  def change
    create_table :available_shifts do |t|
      t.references :student_ambassador, index: true
      t.datetime :starts_at
      t.datetime :ends_at

      t.timestamps
    end
  end
end
