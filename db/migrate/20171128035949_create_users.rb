class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :address
      t.string :province_id

      t.timestamps
    end
  end
end
