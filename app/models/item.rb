class Item < ApplicationRecord
  belongs_to :user
  belongs_to :brand
  belongs_to :size
  belongs_to :item_status
  belongs_to :sale_status
  belongs_to :delivery_status
  belongs_to :category
  belongs_to :delivery_method
  has_many :comments, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :likes, dependent: :destroy
end
