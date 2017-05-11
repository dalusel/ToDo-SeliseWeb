class CreateMyTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :my_tasks do |t|
      t.string :task
      t.string :reminder
      t.boolean :status
      t.integer :tasktime
      t.string :meridiem

      t.timestamps
    end
  end
end
