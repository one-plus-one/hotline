FactoryGirl.define do
  factory :customer do
    phone_num "1234"
    name "Miss Li"
    gender "女"
    age "25"
    education "大学"
    occupation "worker"
    marital_status false
    disability_degree "low"
    address "beijing"
  end
end