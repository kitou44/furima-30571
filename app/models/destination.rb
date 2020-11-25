class Destination < ApplicationRecord
  belongs_to :order
  # attr_accessor :order, :prefecture_id, :city, :post_code, :address, :building, :phone_number 
  # with_options presence: true do
  #   validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
  #   validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  #   validates :address, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Include hyphen(-)"}
  #   validates :building, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Include hyphen(-)"}
  #   validates :phone_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  # end
end