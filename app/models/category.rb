# frozen_string_literal: true

class Category < ApplicationRecord
  belongs_to :user
  has_many :category_expenses, dependent: :destroy
  has_many :expenses, through: :category_expenses

  validates :name, presence: true, length: { in: 1..20 }
  validates :icon, presence: true, length: { in: 1..300 }
end
