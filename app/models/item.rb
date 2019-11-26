class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  # belongs_to :user, foreign_key: 'user_id'
  belongs_to :category

  has_many :images
  accepts_nested_attributes_for :images

end
