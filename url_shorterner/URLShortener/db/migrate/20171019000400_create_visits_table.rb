class CreateVisitsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :visits do |t|
      t.integer :visitor_id, presence: true
      t.integer :url_id, presence: true

      t.timestamps
    end
  end
end
