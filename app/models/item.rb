class Item < ApplicationRecord

	belongs_to :artist
	belongs_to :label
	belongs_to :genre

	has_many :cart_items, dependent: :destroy
	has_many :buy_items, dependent: :destroy
	has_many :discs, dependent: :destroy
	has_many :users, through: :cart_items

	has_many :songs, through: :discs

    #親のフォームに子のフィールドを追加すると、一緒に子の新規登録ができる
    accepts_nested_attributes_for :discs, allow_destroy: true

    attachment :image

end
