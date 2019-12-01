class Item < ApplicationRecord

  belongs_to :user
  belongs_to :brand, optional: true
  belongs_to :size
  belongs_to :item_status
  belongs_to :sale_status
  belongs_to :delivery_status
  belongs_to :category
  belongs_to :delivery_method
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  
  validates :name, length: {maximum: 40}
  validates :price, numericality: {
                      only_integer: true,
                      greater_than_or_equal_to: 300,
                      less_than_or_equal_to: 9999999
                      } 
  validates :description,length: {maximum: 1000}
  validates :name,
            :price,
            :description,
            :item_status_id,
            :sale_status_id,
            :size_id,
            :delivery_status_id,
            :prefecture_id,
            :category_id,
            :delivery_fee,
            presence: true
end
