class Item < ApplicationRecord
  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :price, numericality: { with: /\A[0-9]+\z/, greater_than: 299, less_than: 10_000_000 }
    validates :detail, length: { maximum: 1000 }
    validates :image
  end

  validates :category_id, numericality: { other_than: 1, message: 'Select' }
  validates :status_id, numericality: { other_than: 1, message: 'Select' }
  validates :shipment_source_id, numericality: { other_than: 1, message: 'Select' }
  validates :delivery_charge_id, numericality: { other_than: 1, message: 'Select' }
  validates :period_id, numericality: { other_than: 1, message: 'Select' }

  has_one    :purchase
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :period
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :shipment_source
  belongs_to_active_hash :category
  belongs_to_active_hash :status
end
