class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :organization
      t.booleann, :public
      t.string :default
      t.string :true

      t.timestamps
    end
  end
end
