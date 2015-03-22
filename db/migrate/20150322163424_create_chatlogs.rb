class CreateChatlogs < ActiveRecord::Migration
  def change
    create_table :chatlogs do |t|
      t.references :user, index: true
      t.string :message

      t.timestamps null: false
    end
    add_foreign_key :chatlogs, :users
  end
end
