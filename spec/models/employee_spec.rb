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
require 'rails_helper'

RSpec.describe Employee, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
