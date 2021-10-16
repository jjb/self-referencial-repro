class CreateThings < ActiveRecord::Migration[6.1]
  def change
    create_table :things do |t|
      t.references :thing, null: true, foreign_key: false

      t.timestamps
    end
  end
end
