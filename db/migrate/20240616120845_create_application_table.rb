# frozen_string_literal: true

class CreateApplicationTable < ActiveRecord::Migration[7.1]
  def change
    create_table :applications do |t|
      t.string :user_name
      t.references :job, null: false, foreign_key: true

      t.timestamps
    end
  end
end
