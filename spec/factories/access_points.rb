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
    check { "2021-04-13 21:29:15" }
    status { 1 }
    employee { nil }
  end
end
