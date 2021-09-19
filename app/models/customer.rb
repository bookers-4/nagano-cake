class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy


  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :furigana_last, presence: true
  validates :furigana_first, presence: true
  validates :postcode, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true



  # is_valid==falseの場合、ログインさせない
  def active_for_authentication?
    super && (is_valid?)
  end

end
