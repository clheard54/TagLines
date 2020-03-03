class AddColumnToQuotes < ActiveRecord::Migration[6.0]
  def change
    add_column :quotes, :book?, :boolean
  end
end
