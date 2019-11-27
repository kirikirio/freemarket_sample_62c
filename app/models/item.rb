class Item < ApplicationRecord

  belongs_to :user
  belongs_to :brand
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

end
