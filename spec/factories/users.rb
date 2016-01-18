FactoryGirl.define do
  factory :user do
    name "Aaron Swartz"
    sequence :email do |n|
      "aaron#{n}@freedom.com"
    end
  end

end
