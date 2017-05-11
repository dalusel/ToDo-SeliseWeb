class CreateTaskDates < ActiveRecord::Migration[5.0]
  def change
    create_table :task_dates do |t|
      t.date :taskdate

      t.timestamps
    end
  end
end
