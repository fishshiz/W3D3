class CreateShortenedUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :shortened_urls do |t|
      t.string :short_url, unique: true, presence: true
      t.string :long_url, unique: true, presence: true
      t.integer :user_id, presence: true

      t.timestamps
    end
    add_index :shortened_urls, :user_id
  end
end
