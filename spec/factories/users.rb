FactoryBot.define do
  factory :user do
    nickname                { 'koki' }
    email                   { 'aaa@gmail.com' }
    password                { '1111aaaa' }
    password_confirmation   { '1111aaaa' }
    first_name              { '青木' }
    first_name_kana         { 'アオキ' }
    last_name               { '浩輝' }
    last_name_kana          { 'コウキ' }
    birthday                { '1999-09-09' }
  end
end
