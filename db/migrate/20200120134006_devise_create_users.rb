# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :nickname,           null: false 
      t.string :email,              null: false
      t.string :encrypted_password, null: false
      t.string :firstname, null: false
      t.string :lastname, null: false
      t.string :firstname_kana, null: false
      t.string :lastname_kana, null: false
      t.date   :birthdate, null: false
      
      t.text   :profile
      t.string :image
      t.datetime :remember_created_at
      t.timestamps null: false
    end
    add_index :users, :email,                unique: true
  end
end
