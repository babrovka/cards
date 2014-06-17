class Value < ActiveRecord::Base
  attr_accessible :title, :variant_id
  belongs_to :variant
end
