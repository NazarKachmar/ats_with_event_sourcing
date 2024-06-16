class CreateApplicationTable < ActiveRecord::Migration[7.1]
  def change
    create_table :applications, id: :uuid do |t|
      t.string :candidate_name
      t.references :job, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
