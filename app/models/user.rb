require 'digest'
class User < ActiveRecord::Base
  attr_accessor :password

  validates_uniqueness_of :email
  validates_length_of :email, within: 0..50
  validates_format_of :email , with: /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i, :multiline => true
  validates_confirmation_of :password, :if => :password_required?

  has_one :profile, :dependent => :destroy
  has_many :articles,  :dependent => :nullify
  has_many :replies, :through => :articles, :source => :comments


  default_scope lambda {  order('users.name') }


  before_save :set_encrypted_password




  def self.authenticate(email ,password )
  user = User.find_by_email(email)
  return user if user && ( encrypt(password) == user.hashed_password )
  end

  def authenticated?(pass)
    self.hashed_password == encrypt(pass)
  end

  def highly_liked_article
    self.articles.order('articles.likes DESC').first
  end


  protected

  def set_encrypted_password
    puts name
    return if password.blank?
    self.hashed_password = encrypt(password)
  end

  def encrypt(str)
      Digest::SHA1.hexdigest(str)
  end

  def password_required?
    hashed_password.blank? || password.present?
  end


end
