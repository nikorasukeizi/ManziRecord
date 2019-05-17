class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :buy_infos, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :rubi_first_name, presence: true, format:{with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/}
  validates :rubi_last_name, presence: true, format:{with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/}
  validates :birthdate, presence: true
  validates :tel, presence: true, format:{with: /\A\d{10}\z|\A\d{11}\z/}
  validates :postcode, presence: true, format:{with: /\A\d{7}\z/}
  validates :address, presence: true
  validates :status, inclusion:{in: [true, false]}
  validates :admin, inclusion:{in: [true, false]}

  def active_for_authentication?
      super && self.status?
  end

  def update_without_current_password(params, *options)
  	params.delete(:current_password)

  	if params[:password].blank? && params[:password_confirmation].blank?
  		params.delete(:password)
  		params.delete(:password_confirmation)
  	end

  	result = update_attributes(params, *options)
  	clean_up_passwords
  	result
  end

end
