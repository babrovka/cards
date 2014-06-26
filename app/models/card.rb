class Card < ActiveRecord::Base
  attr_accessible :properties, :rating, :quiz_id
  serialize :properties, ActiveRecord::Coders::Hstore
  belongs_to :quiz
  
  def self.to_csv(options,cards)
    CSV.generate(options) do |csv|
      csv << column_names
      cards.each do |card|
        csv << card.attributes.values_at(*column_names)
      end
    end
  end
end
