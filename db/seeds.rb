# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Size.create!(
  [
    {
      size: 'S',
    },
    {
      size: 'M'
    },
    {
      size: 'L'
    }
  ]
)

DeliveryStatus.create!(
  [
    {
      status: '1~2日で発送'
    },
    {
      status: '2~3日で発送'
    },
    {
      status: '4~7日で発送'
    },
  ]
)

SaleStatus.create!(
  [
    {
      status: '出品中'
    },
    {
      status: 'sold out'
    }
  ]
)

DeliveryMethod.create!(
  [
    {
      method: 'ゆうパック'
    },
    {
      method: 'らくらくメルカリ便'
    }
  ]
)


ItemStatus.create!(
  [
    { status: '新品'},
    { status: '中古'}
  ]
)

Brand.create!(
  name: 'シャネル',
)

ladys = Category.create(name: 'レディース')

ladys_tops = ladys.children.create(name: 'トップス')
ladys_jacket = ladys.children.create(name: 'ジャケット/アウター')

ladys_tops.children.create(
  [
    {name: "Tシャツ/カットソー(半袖/袖なし)"},
    {name: "Tシャツ/カットソー(七分/長袖)"},
    {name: "その他"}
  ]
)

  ladys_jacket.children.create(
  [
    {name: "テーラードジャケット"},
    {name: "ノーカラージャケット"},
    {name: "Gジャン/デニムジャケット"},
    {name: "その他"}
  ]
)

user = User.new(
  {
    firstname: '沢尻',
    lastname: 'エリカ',
    firstname_kana: 'サワジリ',
    lastname_kana: 'エリカ',
    nickname: 'エリカ様',
    password: '12345678',
    email: 'example@example.com',
    user_image: '',
    point: 0,
    birthday: 20191120,
    # confirmed_at: Time.now
  }
)

user.save!

Item.create!(
  [
  {
    name: 'カットソー半袖です1',
    price: '2000',
    description: 'ユニクロのカットソー新品です',
    item_status_id: 1,
    sale_status_id: 1,
    size_id: 1,
    brand_id: 1,
    delivery_status_id: 1,
    prefecture: '広島県',
    user_id: 1,
    category_id: 4,
    delivery_fee: '送料込み',
    delivery_method_id: 1,
  },
  {
    name: 'カットソー半袖です2',
    price: '2000',
    description: 'ユニクロのカットソー新品です',
    item_status_id: 1,
    sale_status_id: 1,
    size_id: 1,
    brand_id: 1,
    delivery_status_id: 1,
    prefecture: '広島県',
    user_id: 1,
    category_id: 4,
    delivery_fee: '送料込み',
    delivery_method_id: 1,
  },
  {
    name: 'カットソー半袖です3',
    price: '2000',
    description: 'ユニクロのカットソー新品です',
    item_status_id: 1,
    sale_status_id: 1,
    size_id: 1,
    brand_id: 1,
    delivery_status_id: 1,
    prefecture: '広島県',
    user_id: 1,
    category_id: 4,
    delivery_fee: '送料込み',
    delivery_method_id: 1,
  },
  {
    name: 'カットソー半袖です4',
    price: '2000',
    description: 'ユニクロのカットソー新品です',
    item_status_id: 1,
    sale_status_id: 1,
    size_id: 1,
    brand_id: 1,
    delivery_status_id: 1,
    prefecture: '広島県',
    user_id: 1,
    category_id: 4,
    delivery_fee: '送料込み',
    delivery_method_id: 1,
  },
  {
    name: 'カットソー半袖です5',
    price: '2000',
    description: 'ユニクロのカットソー新品です',
    item_status_id: 1,
    sale_status_id: 1,
    size_id: 1,
    brand_id: 1,
    delivery_status_id: 1,
    prefecture: '広島県',
    user_id: 1,
    category_id: 4,
    delivery_fee: '送料込み',
    delivery_method_id: 1,
  },
  {
    name: 'カットソー半袖です6',
    price: '2000',
    description: 'ユニクロのカットソー新品です',
    item_status_id: 1,
    sale_status_id: 1,
    size_id: 1,
    brand_id: 1,
    delivery_status_id: 1,
    prefecture: '広島県',
    user_id: 1,
    category_id: 4,
    delivery_fee: '送料込み',
    delivery_method_id: 1,
  },
  {
    name: 'カットソー半袖です7',
    price: '2000',
    description: 'ユニクロのカットソー新品です',
    item_status_id: 1,
    sale_status_id: 1,
    size_id: 1,
    brand_id: 1,
    delivery_status_id: 1,
    prefecture: '広島県',
    user_id: 1,
    category_id: 4,
    delivery_fee: '送料込み',
    delivery_method_id: 1,
  },
  {
    name: 'カットソー半袖です8',
    price: '2000',
    description: 'ユニクロのカットソー新品です',
    item_status_id: 1,
    sale_status_id: 1,
    size_id: 1,
    brand_id: 1,
    delivery_status_id: 1,
    prefecture: '広島県',
    user_id: 1,
    category_id: 4,
    delivery_fee: '送料込み',
    delivery_method_id: 1,
  },
  {
    name: 'カットソー半袖です9',
    price: '2000',
    description: 'ユニクロのカットソー新品です',
    item_status_id: 1,
    sale_status_id: 1,
    size_id: 1,
    brand_id: 1,
    delivery_status_id: 1,
    prefecture: '広島県',
    user_id: 1,
    category_id: 4,
    delivery_fee: '送料込み',
    delivery_method_id: 1,
  },
  {
    name: 'カットソー半袖です10',
    price: '2000',
    description: 'ユニクロのカットソー新品です',
    item_status_id: 1,
    sale_status_id: 1,
    size_id: 1,
    brand_id: 1,
    delivery_status_id: 1,
    prefecture: '広島県',
    user_id: 1,
    category_id: 4,
    delivery_fee: '送料込み',
    delivery_method_id: 1,
  }
]
)