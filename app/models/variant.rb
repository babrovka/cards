class Variant < ActiveRecord::Base
  attr_accessible :title, :values_attributes
  has_many :values
  accepts_nested_attributes_for :values, allow_destroy: true
end
