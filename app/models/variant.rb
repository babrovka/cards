class Variant < ActiveRecord::Base
  attr_accessible :title
  has_many :values
end
