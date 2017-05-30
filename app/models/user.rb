class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :flats
  has_many :conversations, foreign_key: :offer_id
  has_many :messages

  validates :email, :password, presence: true
end
