class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :rating, :default => 0
      t.hstore :properties

      t.timestamps
    end
  end
end
