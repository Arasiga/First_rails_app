class Movie < ActiveRecord::Base

  has_many :reviews

  validates_presence_of :title
  validates_presence_of :director
  validates :runtime_in_minutes, numericality: {only_integer: true}
  validates_presence_of :description
  validates_presence_of :poster_image_url
  validates_presence_of :release_date
  validate :release_date_is_in_the_past

  def release_date_is_in_the_past
    if release_date.present?
      errors.add(:release_date, "Needs to be in the past") if release_date > Date.today
    end
  end

  def review_average
    reviews.sum(:rating_out_of_ten)/reviews.size
  end

end
