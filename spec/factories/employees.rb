# == Schema Information
#
# Table name: employees
#
#  id                :bigint           not null, primary key
#  active            :boolean          default(TRUE)
#  email             :string
#  employee_number   :integer
#  name              :string
#  position          :string
#  private_number    :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  company_branch_id :bigint           not null
#
# Indexes
#
#  index_employees_on_company_branch_id  (company_branch_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_branch_id => company_branches.id)
#
FactoryBot.define do
  factory :employee do
    sequence(:email) { |n| "user#{n}@mail.com" }
    name { Faker::Name.name }
    position { Faker::Job.position }
    employee_number { 1 }
    private_number { Faker::Alphanumeric.alpha(number: 10) }
    active { true }
    company_branch { create(:company_branch) }
  end
end
