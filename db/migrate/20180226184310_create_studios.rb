class CreateStudios < ActiveRecord::Migration[5.1]
  def change
    create_table :studios do |t|
      t.string :name
      t.string :address
      t.integer :phone
      t.string :website
      t.string :image_url
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
