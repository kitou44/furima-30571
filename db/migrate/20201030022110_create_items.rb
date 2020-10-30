class CreateItems < ActiveRecord::Migration[6.0]
  
  def change
    create_table :items do |t|
      t.string :nickname  
      t.string :email   
      t.string :password  
      t.string :family_name
      t.string :first_name 
      t.string :amily_name_kana
      t.string :irst_name_kana
      t.date :birth_day
      t.timestamps
    end
  end
end
