FactoryBot.define do
  factory :product_model do
    name { 'Pelúcia' } 
    height { '50' }
    width { '40' }
    length { '20' }
    weight { 400 }
    supplier
    category
  end
end