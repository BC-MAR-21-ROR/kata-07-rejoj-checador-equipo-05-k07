ActiveAdmin.register Employee do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :name, :position, :employee_number, :private_number, :active, :company_branch_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :name, :position, :employee_number, :private_number, :active, :company_branch_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
