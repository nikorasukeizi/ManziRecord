class Label < ApplicationRecord

	has_many :items, dependent: :destroy

	validates :name, uniqueness: true
	validates :rubi_name, presence: true

end
