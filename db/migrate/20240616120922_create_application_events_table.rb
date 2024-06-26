# frozen_string_literal: true

class CreateApplicationEventsTable < ActiveRecord::Migration[7.1]
  def change
    create_table :application_events do |t|
      t.string :type
      t.references :application, null: false, foreign_key: true
      t.json :data

      t.timestamps
    end
  end
end
