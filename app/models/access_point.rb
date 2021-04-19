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

  validates :check, :employee_id, presence: true

  scope :by_date, -> (date) { where(check: date) }
  scope :by_month, -> (date) { where(check: date.beginning_of_month..date.end_of_month) }
  scope :by_employee, -> (employee_id) { where(employee_id: employee_id) }
end
