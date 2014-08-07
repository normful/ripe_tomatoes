class User < ActiveRecord::Base

  has_many :reviews

  has_secure_password

  paginates_per 2

  def full_name
    "#{firstname} #{lastname}"
  end

end
