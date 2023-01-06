class Contact < ApplicationRecord
  belongs_to :user

  has_many :contacts

  validates :name, :phone_number, presence: true
end
