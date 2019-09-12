class Buyer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :transactions

  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :buyer_zipcode, presence:true
  validates :buyer_adress, presence:true
  validates :buyer_city, presence:true
  validates :buyer_country, presence:true
end
