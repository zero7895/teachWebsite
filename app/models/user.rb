class User < ActiveRecord::Base
  has_many :posts, :dependent => :destroy
  accepts_nested_attributes_for :posts
  validates :name, presence: true
end
