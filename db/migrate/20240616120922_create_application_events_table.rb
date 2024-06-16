class CreateApplicationEventsTable < ActiveRecord::Migration[7.1]
  def change
    create_table :application_events, id: :uuid do |t|
      t.string :type
      t.references :application, null: false, foreign_key: true, type: :uuid
      t.jsonb :data, default: {}

      t.timestamps
    end
  end
end
