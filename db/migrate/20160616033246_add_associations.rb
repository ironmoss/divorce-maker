class AddAssociations < ActiveRecord::Migration

  def change
    create_table :associations do |t|
      t.references :user
      t.references :relationship
      t.timestamps null: false
    end
  end
  
end
