# frozen_string_literal: true

# user
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :full_name, presence: true, length: { minimum: 5 }
  validates :phone, presence: true, length: { is: 11 }, numericality: { only_integer: true }
  has_one :cart, dependent: :destroy
  has_many :orders
  has_many :products, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :photo, dependent: :purge_later

  # callbacks on after creation
  after_create :initilize_cart

  private

  def initilize_cart
    Cart.create(user_id: id)
  end
end
