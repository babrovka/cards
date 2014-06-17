class Card < ActiveRecord::Base
  attr_accessible :properties, :rating
  serialize :properties, ActiveRecord::Coders::Hstore
end
