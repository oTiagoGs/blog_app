class Subject < ApplicationRecord
    has_many :article
    
    # Validations
    validates :description, presence: true, length: { minimum: 3 },  uniqueness: true

    # Pagination
    paginates_per 5
end
