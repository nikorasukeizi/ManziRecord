class Disc < ApplicationRecord

	belongs_to :item

	has_many :songs, dependent: :destroy

    #親のフォームに子のフィールドを追加すると、一緒に子の新規登録ができる
	accepts_nested_attributes_for :songs, allow_destroy: true

    validates :name,   presence: true

end
