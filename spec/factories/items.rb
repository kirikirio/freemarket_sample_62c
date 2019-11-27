FactoryBot.define do
  factory :item do

    name               {'パーカー'}
    price              {3000}
    description        {'いい生地です'}
    item_status_id     {1}
    size_id            {1}
    brand_id           {1}
    delivery_status_id {1}
    prefecture_id      {1}
    category_id        {1}
    user_id            {1}
    delivery_method_id {1}
    delivery_fee       {'送料込み'}
  end
end
