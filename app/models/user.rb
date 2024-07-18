class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :live_room
         has_many :messages
         validates :name, presence: true #これを外すと
         validates :name, presence: true, uniqueness: { case_sensitive: false }

         has_one_attached :avatar
         attr_accessor :remove_avatar
end
