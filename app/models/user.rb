class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates_presence_of :first_name, :last_name       

  def sign_in_count

  end
  def current_sign_in_at
      
  end
  def last_sign_in_at
      
  end
  def last_sign_in_ip
      
  end

  def current_sign_in_ip
      
  end
end
