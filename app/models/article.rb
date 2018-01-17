class Article < ApplicationRecord
  include PgSearch
  pg_search_scope :search, against: [:title, :body], :using => {
                    :tsearch => {:dictionary => "simple", :prefix => true, :any_word => true }
                  }


  def self.perform_search(keyword)
    if keyword.present?
      then Article.search(keyword)
    else Article.all
    end
  end
end
