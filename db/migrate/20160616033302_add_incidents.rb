class AddIncidents < ActiveRecord::Migration

  def change
    create_table :incidents do |t|
      t.references :relationship
      t.string :category
      t.string :description
      t.boolean :forgiven, default: false
      t.float :calculated_points
      t.timestamps null: false
    end 
  end

end
