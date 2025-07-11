class CreateMessages < ActiveRecord::Migration[7.2]
  def change
    create_table :messages do |t|
      t.text :content
      t.belongs_to :sender, null: false, foreign_key: { to_table: :users }
      t.belongs_to :receiver, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
