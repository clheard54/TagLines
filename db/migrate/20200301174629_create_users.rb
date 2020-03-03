class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :user_name
      t.string :email
      t.string :password
      t.string :fave_book
      t.string :fave_movie

      t.timestamps
    end
  end
end
