FactoryGirl.define do
  factory :event do
    name 'name with five characters at least'
    description 'a long description is necessary too'
    date Time.now
  end
end
