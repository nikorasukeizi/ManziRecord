class Item < ApplicationRecord

	#itemステータスをenumで管理
	enum status: { 販売中:0, 販売中止:1 }

	belongs_to :artist
	belongs_to :label
	belongs_to :genre

	has_many :cart_items, dependent: :destroy
	has_many :buy_items
	has_many :discs, dependent: :destroy
	has_many :users, through: :cart_items

	has_many :songs, through: :discs

    #親のフォームに子のフィールドを追加すると、一緒に子の新規登録ができる
    accepts_nested_attributes_for :discs, allow_destroy: true

    attachment :image


     validates :name,   presence: true
     validates :stock,   presence: true
     validates :status,   presence: true
     validates :price,   presence: true

    # def young_rank
	   #  self.items
	   #      .joins(:buy_counts)
	   #      .where("buy_items.created_at Time.now.beginning_of_month..Time.now.end_of_month")
	   #      .group(:item_id)
	   #      .order("sum(buy_items.buy_count) desc, items.id")
	   #      .select("items.*,sum(buy_items.buy_count) as sum_buy_count")
    # end

end
