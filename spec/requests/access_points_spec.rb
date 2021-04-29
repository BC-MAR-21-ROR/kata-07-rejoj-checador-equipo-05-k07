# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'access_points', type: :request do
  describe 'GET access_points#new' do
    it 'return a 200' do
      get '/access_points/new'
      expect(response).to render_template(:new)
    end
  end

  describe 'POST acces_point#create' do
    context 'when employee is no found' do
      before(:each) { post "/access_points", params: { access_point: { code: 'aaa' } } }

      it 'redirect to new' do
        expect(response).to redirect_to(new_access_point_path)
      end

      it 'show a flash error' do
        expect(flash[:alert]).to match(/No se ha encontrado el usuario/)
      end
    end

    context 'when employee is found' do
      let!(:employee) { create(:employee, active: true, private_number: 'a01') }

      context 'and did checkout' do
        let!(:access) { create(:access_point, :out, employee_id: employee.id) }

        it 'show a flash with checkout is already done' do
          post "/access_points", params: { access_point: { code: employee.private_number } }
          expect(flash[:alert]).to match(/El empleado ya ha realizo checkout el dia de hoy/)
        end
      end
    #
      context 'and did not checkout' do
        context 'and did checkin' do
          let!(:access) { create(:access_point, employee_id: employee.id) }

          it 'show a flash of success checkout' do
            post "/access_points", params: { access_point: { code: employee.private_number } }
            expect(flash[:alert]).to match(/Ha realizado checkout correctamente/)
          end
        end

        context 'and did not checkin' do
          it 'show a flash of success checkin' do
            post "/access_points", params: { access_point: { code: employee.private_number } }
            expect(flash[:alert]).to match(/Ha realizado checkin correctamente/)
          end
        end
      end
    end
  end
end
