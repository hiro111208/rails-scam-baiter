class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  validates :firstName, presence: true, length:{maximum: 50}
  validates :lastName, presence: true, length:{maximum: 50}


  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #validates :email, presence: true, length: { maximum: 255 }


  #validates :telephone, presence: true, length:{maximum: 15}
  #validates :address, presence: true

  has_many :accounts
end
