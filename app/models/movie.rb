class Movie < ActiveRecord::Base

  has_many :reviews

  validates :title,
    presence: true

  validates :director,
    presence: true

  validates :runtime_in_minutes,
    numericality: { only_integer: true }

  validates :description,
    presence: true

  mount_uploader :poster_image_url, MoviePosterUploader

  validates :release_date,
    presence: true

  validate :release_date_is_in_the_future

  scope :short, -> { where('runtime_in_minutes < 90') }
  scope :medium, -> { where('runtime_in_minutes BETWEEN 90 AND 120 ') }
  scope :long, -> { where('runtime_in_minutes > 120') }

  private

  def release_date_is_in_the_future
    if release_date.present?
      errors.add(:release_date, "should be in the future") if release_date < Date.today
    end
  end

  def review_average
    reviews.sum(:rating_out_of_ten)/reviews.size if reviews.any?
  end

end
