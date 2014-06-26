class Question < ActiveRecord::Base
  attr_accessible :text, :quiz_id
  belongs_to :quiz
end
