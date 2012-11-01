class Event < ActiveRecord::Base
  attr_accessible :content, :title

  validates :content, presence: true
  validates :title, presence: true

  def self.filter(query)
  	if query && query != 'all'
      query_pattern = "%#{query}%"
      where("title LIKE :query_pattern or content LIKE :query_pattern", query_pattern: query_pattern)
    else
      all
  	end
  end

end
