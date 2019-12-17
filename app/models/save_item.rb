class SaveItem < ApplicationRecord
  belongs_to :library
  belongs_to :item
end
