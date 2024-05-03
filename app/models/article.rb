class Article < ApplicationRecord
  belongs_to :subject
  belongs_to :admin

  # Validations
  validates :title, :content, presence: true

  # Pagination
  paginates_per 5
  
end
