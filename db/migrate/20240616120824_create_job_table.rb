# frozen_string_literal: true

class CreateJobTable < ActiveRecord::Migration[7.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
