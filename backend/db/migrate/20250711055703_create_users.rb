class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, null: false
      t.string :jti,   null: false
      t.references :role, null: false, foreign_key: true
      t.boolean :active, default: true

      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :jti,   unique: true
  end
end
