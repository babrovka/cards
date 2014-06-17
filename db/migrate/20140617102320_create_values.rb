class CreateValues < ActiveRecord::Migration
  def change
    create_table :values do |t|
      t.string :title
      t.integer :variant_id

      t.timestamps
    end
  end
end
