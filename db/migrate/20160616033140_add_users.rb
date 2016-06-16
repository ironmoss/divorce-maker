class AddUsers < ActiveRecord::Migration

  def change
    create_table :users do |t|
      t.references :association
      t.string :nickname
      t.string :email
      t.string :twitter
      t.timestamps null: false
    end
  end

end
