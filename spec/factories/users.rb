FactoryGirl.define do
  factory :user do
    sequence(:email) {|i| "user#{i}@example.com"}
		password "password"

		trait :admin do
			role 'admin'
		end
  end
end
