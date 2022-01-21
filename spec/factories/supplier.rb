FactoryBot.define do
  factory :supplier do
    fantasy_name {'Fornecedor X'} 
    legal_name{ 'Fornecedor X' }
    sequence(:cnpj){|n| "#{n}0000000000000" }
    email { 'emailfake@gmail.com' }
    product { 'Fornecedor de materiais diversos' }
    telephone { '(11) 00000-0000' }
  end
end