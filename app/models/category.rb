class Category < ApplicationRecord
    has_many :operations, :dependent => :destroy

    validates :name, presence: true
    validates :name, uniqueness: true
    validates :description, presence: true

end