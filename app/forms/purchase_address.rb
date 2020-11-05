class PurchaseAddress

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :prefecture_id, :city, :house_number, :building, :post_code, :phone_number, :purchase, :token

  with_options presence: true do
    validates :prefecture_id,numericality:{ other_than: 1 ,message: "Select Prefecture"}
    validates :city
    validates :house_number
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number,length: { maximum: 11 }
    validates :token
  end
  
  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(prefecture_id: prefecture_id, city: city, house_number: house_number, building: building, post_code: post_code, phone_number: phone_number, purchase_id: purchase.id)
  end


end
