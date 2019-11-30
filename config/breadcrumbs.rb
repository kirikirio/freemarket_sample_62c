# ルート
crumb :root do
  link "メルカリ", "/"
end

# マイページ
crumb :users_show do
  link "マイページ",  "/users/#{current_user.id}"
  parent :root
end

# ログアウト
crumb :users_logout do
  link "ログアウト"
  parent :users_show
end

# 出品の中商品一覧
crumb :sellings_index do
  link "出品した商品 - 出品中" ,"/users/#{current_user.id}/sellings"
  parent :users_show
end
# 出品の中商品詳細
crumb :sellings_show do
  link "出品商品画面"
  parent :sellings_index
end

# 本人情報の登録
crumb :addresses_edit do
  link "本人情報の登録"
  parent :users_show
end

# 支払い方法 クレジット登録
crumb :credits_index do
  link "支払い方法"
  parent :users_show
end

# プロフィール編集
crumb :users_profile do
  link "プロフィール"
  parent :users_show
end


# カテゴリー関係
# カテゴリー一覧
crumb :items do
  link "カテゴリー一覧",  "#"
  parent :root
end

# 親カテゴリー
crumb :items_list do
  category = Category.find(1)
  # findの中はparamsのidを入れる
  link category.name
  parent :items
end

