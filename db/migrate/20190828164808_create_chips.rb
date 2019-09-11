class CreateChips < ActiveRecord::Migration[5.2]
  def change
    create_table :chips do |t|
      t.belongs_to :user, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
