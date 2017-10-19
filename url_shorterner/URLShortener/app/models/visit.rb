class Visit < ApplicationRecord
  validates :visitor_id, :url_id, null: false

  belongs_to(
    :visitors,
    class_name: :User,
    foreign_key: :visitor_id,
    primary_key: :id
  )

  belongs_to(
    :visited_urls,
    class_name: :ShortenedUrl,
    foreign_key: :url_id,
    primary_key: :id
  )

  def self.record_visit!(user, shortened_url)
    Visit.create!(:visitor_id => user.id, :url_id => shortened_url.id)
  end
end
