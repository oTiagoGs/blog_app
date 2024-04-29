class Article < ApplicationRecord
  belongs_to :subject
  belongs_to :admin
end
