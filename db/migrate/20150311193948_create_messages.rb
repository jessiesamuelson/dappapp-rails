class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
    	t.references :sender
    	t.references :recipient

    	t.string :subject
    	t.text :content


      t.timestamps null: false
    end
  end
end
