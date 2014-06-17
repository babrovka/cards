class IndexCardsProperties < ActiveRecord::Migration
  def up
    execute "CREATE INDEX cards_properties ON cards USING GIN(properties)"
  end

  def down
    execute "DROP INDEX cards_properties"
  end
end
