class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.string :continent
      t.string :country
      t.string :district
      t.string :case_category
      t.string :description

      t.timestamps
    end
  end
end
