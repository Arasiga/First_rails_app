class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie

  validates_presence_of :user
  validates_presence_of :movie
  validates_presence_of :text


  validates_numericality_of :rating_out_of_ten
  validates :rating_out_of_ten, numericality: {greater_than_of_equal_to: 1}
  validates :rating_out_of_ten, numericality: {less_than_of_equal_to: 10}

end
