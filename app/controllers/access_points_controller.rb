class AccessPointsController < ApplicationController
  def new
    @acces_point = AccessPoint.new
  end

  def create
    employee = Employee.find_by(private_number: params[:access_point][:code])
    if employee
      flash[:alert] = check(employee)
    else
      flash[:alert] = 'No se ha encontrado el usuario'
    end
    redirect_to new_access_point_path
  end

  private

  def access_points_params
    params.require(:access_points).permit(:code)
  end

  def check(employee)
    return 'El empleado ya ha realizo checkout el dia de hoy' if AccessPoint.did_checkout?(employee.id)

    if AccessPoint.did_checkin?(employee.id)
      employee.access_points.create(check: DateTime.now, status: 1)
      'Ha realizado checkout correctamente'
    else
      employee.access_points.create(check: DateTime.now, status: 0)
      'Ha realizado checkin correctamente'
    end
  end
end
