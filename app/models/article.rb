class Article < ApplicationRecord
  belongs_to :subject
  belongs_to :admin

  paginates_per 5
  
end
