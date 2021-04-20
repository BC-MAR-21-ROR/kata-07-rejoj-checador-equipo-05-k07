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
require 'rails_helper'

RSpec.describe AccessPoint, type: :model do
  context 'valid factory' do
    let!(:employee) { create(:employee) }
    it { expect(build(:access_point, employee: employee)).to be_valid }
  end

  describe 'associations' do
    it { should belong_to(:employee) }
  end

  describe 'validations' do
    it { should validate_presence_of(:check) }
    it { should validate_presence_of(:employee_id) }
  end

  describe 'scopes' do
    let!(:employee) { create(:employee) }
    let!(:access1) { create(:access_point, employee_id: employee.id) }
    let!(:access2) { create(:access_point, :out , employee_id: employee.id) }
    let!(:access3) { create(:access_point, :yesterday) }
    let!(:access4) { create(:access_point, :months_ago) }

    context 'by_date(date)' do
      it { expect(AccessPoint.by_date(Date.today)).to include(access1, access2) }
      it { expect(AccessPoint.by_date(Date.today)).not_to include(access3) }
    end

    context 'by_month(date)' do
      it { expect(AccessPoint.by_month(Date.today)).to include(access1, access2) }
      it { expect(AccessPoint.by_month(Date.today)).not_to include(access4)}
    end

    context 'by_employee' do
      it { expect(AccessPoint.by_employee(employee.id)).to include(access1, access2) }
      it { expect(AccessPoint.by_employee(employee.id)).not_to include(access3) }
    end
  end
end
