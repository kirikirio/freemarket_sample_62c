FactoryBot.define do
  factory :image do
    image               { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.png'))}
    item_id              {1}
  end
end
