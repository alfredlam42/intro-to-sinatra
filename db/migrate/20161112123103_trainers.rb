class Trainers < ActiveRecord::Migration
  def change
    create_table :trainers do |t|
      t.string :name
      t.string :gender
      t.integer :age
    end
  end
end
