class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.timestamps
      t.string      :name,               null: false
      t.integer     :price,              null: false
      t.text        :detail,             null: false
      t.integer     :category_id,        null: false
      t.integer     :status_id,          null: false
      t.integer     :shipment_source_id, null: false
      t.integer     :delivery_charge_id, null: false
      t.integer     :period_id,          null: false
      t.references  :user,               null: false, foreign_key: true
    end
  end
end
