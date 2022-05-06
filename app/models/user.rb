# frozen_string_literal: true

# user
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_one :cart, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :photo, dependent: :purge_later

  # callbacks on after creation
  after_create :initilize_cart

  private

  def initilize_cart
    Cart.create!(user_id: id)
  end
end
