class BookStatus < ActiveRecord::Base
    extend FriendlyId
    friendly_id :name, use: :slugged

    def normalize_friendly_id(input)
    	input.to_slug.normalize(transliterations: :vietnamese).to_s
  	end
end
