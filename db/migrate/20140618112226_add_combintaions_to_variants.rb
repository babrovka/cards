class AddCombintaionsToVariants < ActiveRecord::Migration
  def change
    add_column :variants, :combinations, :string

  end
end
