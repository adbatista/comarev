class Company < ApplicationRecord
  validates :name, :cnpj, :active, presence: true
  validates :cnpj, uniqueness: true

  has_many :company_users, dependent: :destroy
  has_many :users, through: :company_users
end