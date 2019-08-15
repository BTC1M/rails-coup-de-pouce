class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :participations
  has_many :missions, through: :participations

  validates :first_name, uniqueness: { scope: :last_name }
  validates :birthday, presence: true
end
