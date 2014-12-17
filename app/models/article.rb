class Article < ActiveRecord::Base
validates_presence_of :title, :body
belongs_to :user
has_and_belongs_to_many  :categories
has_many :comments

scope :published, lambda { where('articles.published_at IS NOT NULL')}
scope :draft, -> { where('articles.published_at IS NULL') }
scope :recent, lambda { where('articles.published_at > ?',1.week.ago.to_date)}
scope :where_title, lambda {|term| where('articles.title LIKE ?',"%#{term}%") }
scope :uncategorized, lambda { joins('LEFT JOIN articles_categories ON articles.id=articles_categories.article_id').where('articles_categories.category_id IS NULL')    }

  def long_title
    "#{title} - #{published_at}"
  end


end
