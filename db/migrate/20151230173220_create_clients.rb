class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.integer :age
      t.string :photo
      t.references :shelter, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
