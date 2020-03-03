class CreateQuoteTags < ActiveRecord::Migration[6.0]
  def change
    create_table :quote_tags do |t|
      t.integer :quote_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
