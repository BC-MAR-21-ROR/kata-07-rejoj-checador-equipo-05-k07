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
class AccessPoint < ApplicationRecord
  enum status: { in: 0, out: 1 }
  belongs_to :employee
end
