class CreateAcmeSales < ActiveRecord::Migration[5.2]
  def change
    create_table :acme_sales do |t|
      t.string        :customer_name
      t.string        :item_description
      t.string       :item_price
      t.integer       :quantity, default: 0
      t.string        :merchant_name
      t.string        :merchant_address
      t.timestamps
    end
  end
end
