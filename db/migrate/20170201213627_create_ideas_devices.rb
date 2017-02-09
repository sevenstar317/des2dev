class CreateIdeasDevices < ActiveRecord::Migration[5.0]
  def change
    create_table :ideas_devices do |t|
      t.references :idea, foreign_key: true
      t.references :device, foreign_key: true
      t.string :note

      t.timestamps
    end
  end
end
