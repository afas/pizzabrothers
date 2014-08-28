class CreateStatics < ActiveRecord::Migration
  def change
    create_table :statics do |t|
      t.string :title
      t.text :body
      t.string :short_url

      t.timestamps
    end
  end
end
