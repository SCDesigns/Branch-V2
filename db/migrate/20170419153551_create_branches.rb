class CreateBranches < ActiveRecord::Migration[5.0]
  def change
    create_table :branches do |t|
      t.references :city, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.string :organization
      t.date :date
      t.string :location
      t.text :info # note text allows for longer description here than string in prev branch app
      t.timestamps
    end
  end
end
