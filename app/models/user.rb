class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :items, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, 
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  #ニックネームのバリデーション
  validates :nickname, length: { minimum: 1, maximum: 30 }, on: :validates_registration

  #性のバリデーション
  validates :lastname, length: { minimum: 1, maximum: 30 }, on: :validates_registration
  validates :lastname, length: { minimum: 1, maximum: 30 }, on: :validates_address

  #名のバリデーション
  validates :firstname, length: { minimum: 1, maximum: 30 }, on: :validates_registration
  validates :firstname, length: { minimum: 1, maximum: 30 }, on: :validates_address

  #性カナのバリデーション
  validates :lastname_kana, length: { minimum: 1, maximum: 30 }, on: :validates_registration
  validates :lastname_kana, length: { minimum: 1, maximum: 30 }, on: :validates_address

  #名カナのバリデーション
  validates :firstname_kana, length: { minimum: 1, maximum: 30 }, on: :validates_registration
  validates :firstname_kana, length: { minimum: 1, maximum: 30 }, on: :validates_address

  #生年月日のバリデーション
  validates :birthday, length: { minimum: 8, maximum: 10 }, on: :validates_registration

  #電話番号のバリデーション
  validates :tel_number, length: { is: 11 }, on: :validates_authentication

  #郵便番号のバリデーション
  validates :postal_code, length: { is: 8 }, on: :validates_address

  #都道府県のバリデーション
  validates :prefecture_id, numericality: true, on: :validates_address

  #市区町村のバリデーション
  validates :city, length: { minimum: 1, maximum: 30 }, on: :validates_address
  
  #番地のバリデーション
  validates :city_block, length: { minimum: 1, maximum: 30 }, on: :validates_address


  # SNS認証 facebookとGoogleからuid,provider,email,などの値を受け取ってomniauth_callbacks_controller.rbにsessionとして送る。
  def self.find_oauth(auth)
    @user = User.where(uid: auth.uid, provider: auth.provider).first #usersテーブルにprovider、uidがあったらログイン処理
              
      unless @user       
        @user = User.new(
                        uid: auth.uid,
                        provider: auth.provider,
                        nickname: auth.info.nickname,
                        email: auth.info.email,
                        user_image:auth.info.image,
                        password: Devise.friendly_token[0, 20],
                      )
      end
     return @user
  end
end
