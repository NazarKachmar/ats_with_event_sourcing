class CreateJobEventsTable < ActiveRecord::Migration[7.1]
  def change
    create_table :job_events, id: :uuid do |t|
      t.string :type
      t.references :job, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
