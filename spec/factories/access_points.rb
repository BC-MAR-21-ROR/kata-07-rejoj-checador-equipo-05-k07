# == Schema Information
#
# Table name: access_points
#
#  id          :bigint           not null, primary key
#  check       :datetime
#  status      :integer          default("in")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  employee_id :bigint           not null
#
# Indexes
#
#  index_access_points_on_employee_id  (employee_id)
#
# Foreign Keys
#
#  fk_rails_...  (employee_id => employees.id)
#
FactoryBot.define do
  factory :access_point do
    check { Date.today }
    status { 0 }
    employee { create(:employee) }

    trait :out do
      status { 1 }
    end

    trait :yesterday do
      check { Date.yesterday }
    end

    trait :months_ago do
      check { 2.month.ago }
    end
  end
end
