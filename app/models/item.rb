class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  # belongs_to :user, foreign_key: 'user_id'
  belongs_to :category

  has_many :images
  accepts_nested_attributes_for :images


  validates :name, presence: true, length: {maximum: 40}
  validates :price, presence: true,numericality: {only_integer: true, greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999} 
  validates :description, presence: true,length: {maximum: 1000}
  validates :item_status_id, presence: true
  validates :sale_status_id, presence: true
  validates :size_id, presence: true
  validates :delivery_status_id, presence: true
  validates :prefecture_id, presence: true
  validates :category_id, presence: true
  validates :delivery_fee, presence: true
  validates :delivery_method_id, presence: true
  # validates :images, associated: true

end
