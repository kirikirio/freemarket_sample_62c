FactoryBot.define do
  factory :user do
    id{'1'}
    firstname{'プログラミング'}
    lastname{'太郎'}
    firstname_kana{'プログラミング'}
    lastname_kana{'タロウ'}
    nickname{'タロウ君'}
    profile{'こんにちは'}
    birthday{'20191120'}
    user_image{''}
    point{'0'}
    postal_code{'0'}
    prefecture_id{'1'}
    city{'大阪市'}
    city_block{'番地'}
    building{'スカイO'}
    tel_number{'9011'}
    customer_id{'1'}
    card_id{'1'}
    provider{'1'}
    uid{'1'}
    email{'hfiglh@e'}
    encrypted_password{''}
    reset_password_token{''}
    reset_password_sent_at{''}
    remember_created_at{'1'}
    confirmation_token{'1'}
    confirmed_at{''}
    confirmation_sent_at{''}
    unconfirmed_email {'1'}
    password{'11111111111'}
  end
end
