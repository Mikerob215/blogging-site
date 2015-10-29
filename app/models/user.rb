class User < ActiveRecord::Base

# validations
  before_save {self.email = email.downcase}
  validates :name, presence: true, length: {minimum: 4, maximum: 80}
  validates :email, presence: true, uniqueness: true, length: {minimum: 6, maximum: 255}


  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

# associations
  has_many :posts
  has_many :comments
  has_many :replies
end
