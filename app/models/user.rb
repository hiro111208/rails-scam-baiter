class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  validates :firstName, presence: true, length:{maximum: 50}
  validates :lastName, presence: true, length:{maximum: 50}
  #validates :position, presence: true


  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }
                    #format: { with: VALID_EMAIL_REGEX },
                    #uniqueness: { case_sensitive: false }


  #validates :telephone, presence: true, length:{maximum: 15}
  #validates :address, presence: true
  # has_many :accounts # foreign key, having many bank accounts
  has_secure_password
  validates :password, presence: true #, length: { minimum: 8 }
end
