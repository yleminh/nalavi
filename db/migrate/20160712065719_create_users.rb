class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :encrypt_password
      t.string :salt
      t.string :provider
      t.integer :role_id
      t.boolean :delete_flag
      t.string :created_by
      t.string :updated_by

      t.timestamps null: false
    end
  end
end
