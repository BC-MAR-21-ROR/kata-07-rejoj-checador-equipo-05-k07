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
class Employee < ApplicationRecord
  belongs_to :company_branch
  has_many :access_points

  validates :name, :company_branch_id, presence: true
  validates :email, :private_number, presence: true, uniqueness: true

  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
  scope :by_branch, -> (branch_id) { where(company_branch_id: branch_id) }
end
