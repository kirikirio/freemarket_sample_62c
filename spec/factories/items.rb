FactoryBot.define do
  factory :item do
    id{"1"}
    name {"カットソー半袖です1"}
    price {"1000"}
    description {"ユニクロのカットソー新品です"}
    item_status_id {"1"}
    sale_status_id {"1"}
    size_id{"1"}
    brand_id {"1"}
    delivery_status_id{"1"}
    prefecture_id {"1"}
    user_id{"1"}
    category_id{"3"}
    delivery_fee {"送料込み"}
    delivery_method_id{"1"}
  end
end
