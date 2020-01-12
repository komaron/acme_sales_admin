class CreateAcmeSales < ActiveRecord::Migration[5.2]
  def change
    create_table :acme_sales do |t|
      t.string        :customer_name
      t.string        :item_description
      t.decimal       :item_price, default: 0, :precision => 8, :scale => 2
      t.integer       :quantity, default: 0
      t.string        :merchant_name
      t.string        :merchant_address
      t.timestamps
    end
  end
end
