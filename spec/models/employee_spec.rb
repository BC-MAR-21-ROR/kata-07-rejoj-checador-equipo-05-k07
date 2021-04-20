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
  context 'valid factory' do
    it { expect(build(:employee)).to be_valid }
  end

  describe 'associations' do
    it { should belong_to(:company_branch) }
    it { should have_many(:access_points) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:private_number) }
    it { should validate_presence_of(:company_branch_id) }
  end

  describe 'scopes' do
    context 'active' do
      let!(:employee1) { create(:employee, active: true) }
      let!(:employee2) { create(:employee, active: false) }

      it { expect(Employee.active).to include(employee1) }
      it { expect(Employee.active).not_to include(employee2) }
    end

    context 'inactive' do
      let!(:employee1) { create(:employee, active: true) }
      let!(:employee2) { create(:employee, active: false) }

      it { expect(Employee.inactive).not_to include(employee1) }
      it { expect(Employee.inactive).to include(employee2) }
    end

    context 'by_branch(branch_id)' do
      let!(:employee1) { create(:employee) }
      let!(:employee2) { create(:employee) }
      let!(:company_branch_id1) { employee1.company_branch_id }
      let!(:company_branch_id2) { employee2.company_branch_id }

      it { expect(Employee.by_branch(company_branch_id1)).to include(employee1) }
      it { expect(Employee.by_branch(company_branch_id1)).not_to include(employee2) }
      it { expect(Employee.by_branch(company_branch_id2)).not_to include(employee1) }
      it { expect(Employee.by_branch(company_branch_id2)).to include(employee2) }
    end
  end
end
