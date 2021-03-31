class AdminsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_admin, only: %i[show update destroy]

  def index
    admins = Admin.all
    render json: { sataus: :ok, data: admins }
  end

  def show
    render json: { status: :ok, data: @admin }
  end

  def create
    @admin = Admin.create!(controller_params)
    render json: { status: :ok, data: @admin }
  end

  def update
    @admin.update(controller_params)
    render json: { status: :ok, data: @admin }
  end

  def destroy
    @admin.destroy
    render json: { status: :ok, message: "deleted admin" }
  end

  private

    def controller_params
      params.require(:admin).permit(:name, :email)
    end

    def id
      params[:id]
    end

    def set_admin
      @admin = Admin.find(id)
    end
end
