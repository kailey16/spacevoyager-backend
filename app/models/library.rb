class Library < ApplicationRecord
  belongs_to :user
  has_many :save_items
  has_many :items, through: :save_items
end
