class AddQuizIdToCards < ActiveRecord::Migration
  def change
    add_column :cards, :quiz_id, :integer
  end
end
