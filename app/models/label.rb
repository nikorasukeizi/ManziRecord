class Label < ApplicationRecord

	has_many :items, dependent: :destroy

end
