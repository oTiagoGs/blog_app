class Article < ApplicationRecord
  belongs_to :subject
  belongs_to :admin

  # Validations
  validates :title, :content, presence: true

  # Pagination
  paginates_per 6
  
  # Scopes
  scope :last_articles, ->(page){
    includes(:subject)
    .order('id desc')
    .page(page)
  }

end
