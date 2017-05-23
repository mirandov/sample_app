class CreateBarrels < ActiveRecord::Migration
  def change
    create_table :barrels do |t|
      t.string :location, null: false
      t.date :date_of_manufacture, null: false
      t.float :amount, null: false
      t.string :is_empty, null: false
      t.date :date_of_completion, null: false
      t.references :wine_sort, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
  def up
    execute("ALTER TABLE barrels ADD CONSTRAINT is_empty_check CHECK(is_empty IN('Пустая','Не пустая'))")
    execute("ALTER TABLE barrels ADD CONSTRAINT amount_check CHECK(amount >= 0)")
  end

  def down
    execute("ALTER TABLE barrels DROP CONSTRAINT is_empty_check")
    execute("ALTER TABLE barrels DROP CONSTRAINT amount_check")
  end

end
