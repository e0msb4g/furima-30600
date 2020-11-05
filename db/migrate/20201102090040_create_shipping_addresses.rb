class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|

      t.timestamps
      t.integer      :prefecture_id,null: false
      t.string       :city,null: false
      t.string       :house_number,null: false
      t.string       :building
      t.string       :post_code,null: false
      t.string       :phone_number,null: false
      t.references   :purchase,null: false,foreign_key: true
    end
  end
end
