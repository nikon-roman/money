class Operation < ApplicationRecord
  belongs_to :category
  
  validates :odate, presence: true
  validates :description, presence: true
  validates :amount, numericality: { greater_than: 0 }

  paginates_per 12
end