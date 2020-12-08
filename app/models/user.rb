class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  validates :firstName, presence: true, length: { maximum: 50 }
  validates :lastName, presence: true, length: { maximum: 50 }

  has_many :accounts
end
