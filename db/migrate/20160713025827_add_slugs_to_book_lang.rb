class AddSlugsToBookLang < ActiveRecord::Migration
  def change
    add_column :book_languages, :slug, :string
    add_index :book_languages, :slug, unique: true
  end
end
