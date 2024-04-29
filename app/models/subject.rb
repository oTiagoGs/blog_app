class Subject < ApplicationRecord
    has_many :article
    
    paginates_per 5
end
