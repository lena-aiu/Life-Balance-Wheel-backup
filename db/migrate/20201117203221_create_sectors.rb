class CreateSectors < ActiveRecord::Migration[5.0]
  def change
    create_table :sectors do |t|
      t.string :name
      t.string :trainer
      t.integer :value
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
