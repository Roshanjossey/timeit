FactoryGirl.define do
  factory :entry do
    date Date.today
    association :user, factory: :user
    association :project, factory: :project
    duration 2.5
    billable true
  end
end
