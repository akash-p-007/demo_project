require 'faker'

FactoryGirl.define do

  factory :user do
    email "superadmin@example.com"
    password "123456"
    name "superadmin"
  end

end