FactoryBot.define do
  factory :article do
    title               {"タイトル"}
    text                {"テキスト"}
    association :user

    after(:build) do |article|
      article.image.attach(io: File.open('public/images/car.jpg'), filename: 'car.jpg')
    end
  end
end