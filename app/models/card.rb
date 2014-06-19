class Card < ActiveRecord::Base
  attr_accessible :properties, :rating
  serialize :properties, ActiveRecord::Coders::Hstore
  
  def self.to_csv(options,cards)
    CSV.generate(options) do |csv|
      csv << column_names
      cards.each do |card|
        csv << card.attributes.values_at(*column_names)
      end
    end
  end
end
