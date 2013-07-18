class Question < ActiveRecord::Base
  attr_accessible :question
  has_many :answers
  has_many :user_answers
end
