ActiveAdmin.register AccessPoint do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  actions :all, except: [:new, :create, :edit, :update]
  permit_params :check, :status, :employee_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:check, :status, :employee_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
