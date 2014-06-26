class Quiz < ActiveRecord::Base
  attr_accessible :title
  has_many :variants
  has_many :cards
  has_one :question
  extend FriendlyId
  friendly_id :title, use: :slugged
end
