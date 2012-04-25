class CinfosController < ApplicationController

  layout "cinfos"
  def index
  end

  def create

    @user=User.create(:firstname=>params[:firstname], :email=>params[:email], :username=>params[:username],:state=>params[:state], 
      :password=>params[:password], :retype_password=>params[:retype_password])	
    @user.save

    @tcom=Tcom.create(:title=>params[:title], :business_email=>params[:business_email], :company_name=>params[:company_name],:website=>params[:website],
      :business_phone=>params[:business_phone],:alternative_phone=>params[:alternative_phone], :address=>params[:address],:city=>params[:city], :zipcode=>params[:zipcode],
      :company_state=>params[:company_state], 	:duns=>params[:duns],:no_of_employee=>params[:no_of_employee], :business_start_date=>params[:business_start_date],
      :facility_clearance=>params[:facility_clearance],:contract_experience=>params[:contract_experience],:product_and_service=>params[:product_and_service], :business_structure=>params[                          :business_structure], :customer_focus=>params[:customer_focus],:industry_focus=>params[:industry_focus], :keywords=>params[:keywords])	
     @tcom.save
  end
  
  def sam
  end
  
end