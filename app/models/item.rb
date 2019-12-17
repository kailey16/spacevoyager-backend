class Item < ApplicationRecord
  has_many :save_items
  has_many :libraries, through: :save_items
end
