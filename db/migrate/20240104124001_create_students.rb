class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name
      t.integer :marks
      t.string :college
      t.integer :passed_out_year

      t.timestamps
    end
  end
end
