class CreateAcmeSaleReports < ActiveRecord::Migration[5.2]
  def change
    create_table :acme_sale_reports do |t|
      t.string :file_name
      t.timestamps
    end
  end
end
