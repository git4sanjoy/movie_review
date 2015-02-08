class VendorsController < ApplicationController
  before_action :set_vendor, only: [:show, :edit, :update, :destroy]

  def index
    @vendors = Vendor.all
  end

  def show
    @vendor = Vendor.find(params[:id])
  end

  def new
    @vendor = Vendor.new
  end

  def edit
  end

  def create
    @vendor = Vendor.new(vendor_params)
    if @vendor.save
      if params[:vendor][:image].present?
        render 'crop'
      else
        redirect_to @vendor, notice: "Successfully created vendor"
      end
    else
      render 'new'
    end
  end

  def update

    if @vendor.update(vendor_params)
      if params[:vendor][:image].present?
        render 'crop'
      else
        redirect_to @vendor, notice: "Successfully updated user."
      end
    else
      render 'edit'
    end

  end


  def destroy
    @vendor.destroy
    redirect_to vendors_url
  end

  private
    def set_vendor
      @vendor = Vendor.find(params[:id])
    end

    def vendor_params
      params.require(:vendor).permit(:name, :image, :crop_x, :crop_y, :crop_w, :crop_h)
    end
end
