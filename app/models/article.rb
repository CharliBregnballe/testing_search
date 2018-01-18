class Article < ApplicationRecord
  include PgSearch
  pg_search_scope :search,
    against: { title: 'A', body: 'B' },
      using: {
        tsearch: {
          prefix: true,
          any_word: true
        }
      }


end
