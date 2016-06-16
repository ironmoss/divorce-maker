class AddIncidents < ActiveRecord::Migration

  def change
    create_table :incidents do |t|
      t.references :user
      t.references :relationship
      t.string :category
      t.string :description
      t.string :status
      t.integer :calculated_points
      t.timestamps null: false
    end 
  end

end
