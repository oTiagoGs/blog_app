class Article < ApplicationRecord
  belongs_to :subject, counter_cache: true
  belongs_to :admin

  # Validations
  validates :title, :content, presence: true

  # Pagination
  paginates_per 8
  
  # Scopes
  scope :_article_, ->(id){
    includes(:subject, :admin)
    .find(id)
  }

  scope :last_articles, ->(page){
    includes(:subject)
    .order('id desc')
    .page(page)
  }

  scope :_subject_, ->(page, subject_id){
    includes(:subject)
    .where(subject_id: subject_id)
    .page(page)
  }

end
