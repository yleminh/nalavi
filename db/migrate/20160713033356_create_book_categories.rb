class CreateBookCategories < ActiveRecord::Migration
  def change
    create_table :book_categories do |t|
      t.string :name
      t.string :description
      t.string :slug
      t.boolean :delete_flag
      t.string :created_by
      t.string :updated_by

      t.timestamps null: false
    end
  end
end
