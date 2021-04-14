# == Schema Information
#
# Table name: company_branches
#
#  id         :bigint           not null, primary key
#  address    :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :company_branch do
    name { "MyString" }
    address { "MyString" }
  end
end
