class CreateVariants < ActiveRecord::Migration
  def change
    create_table :variants do |t|
      t.string :title

      t.timestamps
    end
  end
end
