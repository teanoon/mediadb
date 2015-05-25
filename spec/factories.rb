FactoryGirl.define do
  # user ====================================================
  factory :user do
    sequence(:email) { |n| "person#{n}@gmail.com" }
    password 'password'
  end

  factory :medium do
    login_name 'good_name'
    media_type Medium.media_types[:wechat]
    user
  end

  factory :article do
    title 'good title'
    url 'http://localhost:3000/'
    content 'good content'
  end
end