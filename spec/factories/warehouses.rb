FactoryBot.define do
  factory :warehouse do
    name { "Maceió" }
    code { "MCZ" }
    description { "Legal" }
    address { "Rua Almeida, 1000" }
    city { "Maceió" }
    state { "MC" }
    postal_code { "01300-000" }
    total_area { "3000" }
    useful_area { "2600" }
  end
end
