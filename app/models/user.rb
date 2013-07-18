class User < ActiveRecord::Base
  attr_accessible :email
  
  has_many :user_answers, :dependent => :destroy
  
  validates_presence_of :email
  validates :email, uniqueness: { case_sensitive: false }
  before_create validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  before_create { generate_token(:authtoken) }
  
  private
  
  def generate_token(column)
    begin
      self[column] = SecureRandom.base64.tr("+/", "-_")
    end while User.exists?(column => self[column])
  end
    
end
