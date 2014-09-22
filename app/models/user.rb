class User < ActiveRecord::Base
  has_one :profile, :dependent => :destroy
  has_many :articles, -> {order('published_at DESC, title ASC')},  :dependent => :nullify
  has_many :replies, :through => :articles, :source => :comments

  validates_uniqueness_of :email
  validates_length_of :email, within: 0..50
  validates_format_of :email , with: /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i, :multiline => true
  validates_confirmation_of :password
end
