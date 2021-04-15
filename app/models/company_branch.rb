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
class CompanyBranch < ApplicationRecord
  has_many :employees
end
