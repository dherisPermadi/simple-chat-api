class User < ApplicationRecord
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable,  :rememberable, :validatable

  validates :email, presence: true, uniqueness: true

  validates :password_confirmation, presence: true, on: :update, if: :password_exist

  private

  def password_exist
    password.present?
  end
end
