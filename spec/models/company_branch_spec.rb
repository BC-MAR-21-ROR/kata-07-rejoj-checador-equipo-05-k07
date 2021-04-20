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
require 'rails_helper'

RSpec.describe CompanyBranch, type: :model do

  context 'valid factory' do
    it { expect(build(:company_branch)).to be_valid }
  end

  describe 'associations' do
    it { should have_many(:employees) }
  end

  describe 'validate_end _at_with_comapanybranch' do
    subject {
      CompanyBranch.new(id: 'null',
                        address: 'address',
                        name: 'name',
                        created_at: '2020-01-01 00:00:00',
                        updated_at: '2020-01-01 00:00:00'
      )
    }

    it 'is valid with attributes' do
      expect(subject).to be_valid
    end

    it 'is valid the id registers only integers' do
      subject.id = 1
      expect(subject.id).to be_a_kind_of(Integer)
    end

    it 'is invalid if the id records float' do
      subject.id = 1.5
      expect(subject.id).not_to be_an_instance_of(Float)
    end
  end
end
