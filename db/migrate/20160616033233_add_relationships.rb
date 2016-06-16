class AddRelationships < ActiveRecord::Migration

  def change
    create_table :relationships do |t|
      t.references :association
      t.boolean :status_of_relationship, default: true
      t.timestamps null: false 
    end
  end

end
