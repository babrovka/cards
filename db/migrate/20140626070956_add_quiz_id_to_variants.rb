class AddQuizIdToVariants < ActiveRecord::Migration
  def change
    add_column :variants, :quiz_id, :integer
  end
end
