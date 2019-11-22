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
      status: '２日〜３日で発送'
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
      status: '取引中'
    },
    {
      status: 'sold out'
    }
  ]
)

DeliveryMethod.create!(
  [
    {
      method: '未定'
    },
    {
      method: 'らくらくメルカリ便'
    },
    {
      method: 'ゆうメール'
    },
    {
      method: 'レターパック'
    },
    { 
      method: '普通郵便(定型、定型外)'
    },
    {
      method: 'クロネコヤマト'
    },
    {
      method:  'ゆうパック'
    },
    {
      method: 'クリックポスト'
    },
    {  
      method: 'ゆうパケット'
    }
  ]
)

Brand.create!(
  [
    {
      name: 'ルイヴィトン'
    },
    {  
      name: 'アディダス'
    }
  ]
)

ItemStatus.create!(
  [
    { status: '新品、未使用'},
    { status: '未使用に近い'},
    { status: '目立った傷や汚れなし'},
    { status: 'やや傷や汚れあり'},
    { status: '傷や汚れあり'},
    { status: '全体的に状態が悪い'}
  ]
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

mens = Category.create(name: 'メンズ')
mens_tops = mens.children.create(name: 'トップス')
mens_jacket = mens.children.create(name: 'ジャケット/アウター')

mens_tops.children.create(
  [
    {name: "Tシャツ/カットソー(半袖/袖なし)"},
    {name: "Tシャツ/カットソー(七分/長袖)"},
    {name: "その他"}
  ]
)

  mens_jacket.children.create(
  [
    {name: "テーラードジャケット"},
    {name: "ノーカラージャケット"},
    {name: "Gジャン/デニムジャケット"},
    {name: "その他"}
  ]
)


user = User.new(
  {
    firstname: '山田',
    lastname: '彩',
    firstname_kana: 'ヤマダ',
    lastname_kana: 'アヤ',
    nickname: 'hoge',
    password: '12345678',
    email: 'example@example.com',
    user_image: '',
    point: 0,
    birthday: 20191120,
    # confirmed_at: Time.now
  }
)

user.save!

# Item.create!(
#   [
#   {
#     name: 'レディースのカットソー',
#     price: '2000',
#     description: 'ユニクロのカットソーです',
#     item_status_id: 1,
#     sale_status_id: 1,
#     size_id: 1,
#     # brand_id: 1,
#     deliveryStatus: 1,
#     prefecture: 1,
#     user_id: 1,
#     category_id: 4,
#   }
# ]
# )