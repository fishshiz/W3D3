class ShortenedUrl < ApplicationRecord
  # include 'SecureRandom'
  validates :short_url, :long_url, presence: true, uniqueness: true
  validates :user_id, presence: true

  def self.random_code
    code = SecureRandom.urlsafe_base64

    while exists?(code)
      code = SecureRandom.urlsafe_base64
    end
    code
  end

  def num_clicks
    visitors.count
  end

  def num_uniques
    users = self.select { |ids| ids.user_id }
    users.distinct.count
  end

  def num_recent_uniques

  end

  def self.url_shortener(user, long_url)
    ShortenedUrl.create!(:short_url => ShortenedUrl.random_code, :long_url => long_url, :user_id => user.id)
  end

  belongs_to(
    :submitter,
    class_name: :User,
    foreign_key: :user_id,
    primary_key: :id
  )

  has_many(
    :visits,
    class_name: :Visit,
    foreign_key: :url_id,
    primary_key: :id
  )

  has_many :visitors, through: :visits, source: :visitors
end
