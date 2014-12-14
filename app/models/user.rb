class User < ActiveRecord::Base
  has_secure_password
  has_many :posts, :dependent => :destroy
  accepts_nested_attributes_for :posts
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  before_save :downcase_email

  def downcase_email
  	self.email = email.downcase
  end

end
