class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
    	t.string :name, null: false #null: false is a db constraint
    	t.string :year_built

      t.timestamps null: false
    end
  end
end
