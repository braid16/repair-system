class CreateRepairs < ActiveRecord::Migration[7.2]
  def change
    create_table :repairs do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :phone_number
      t.string :organization
      t.text :content
      t.string :status
      t.datetime :repair_time

      t.timestamps
    end
  end
end
