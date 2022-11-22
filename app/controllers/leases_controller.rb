class LeasesController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

    def index
        leases = Lease.all
        render json: leases
    end

    def show
        lease = Lease.find(params[:id])
        render json: lease
    end

    def create
        lease = Lease.create!(lease_params)
        render json: lease
    end

    def destroy
        lease = Lease.find(params[:id])
        lease.destroy
    end


    private

    def lease_params
        params.permit(:rent, :apartment_id, :tenant_id)
    end

    def render_unprocessable_entity(e)
        render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end

end
