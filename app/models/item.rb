class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  # belongs_to :user, foreign_key: 'user_id'
  belongs_to :category

  has_many :images
  # , dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  # belongs_to :user

  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
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
