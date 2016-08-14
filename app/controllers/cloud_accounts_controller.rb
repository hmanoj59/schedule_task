require 'securerandom'
class CloudAccountsController < ApplicationController


  layout "cloud_account"
  def index
    @cloud_accounts= CloudAccount.order("id ASC")
  end

  def show
    @cloud_account=CloudAccount.find(params[:id])
  end

  def new
    @cloud_account=CloudAccount.new
    random_string = SecureRandom.hex
    external_id="skejuler-"+random_string
    @cloud_account.external_id=external_id

  end

  def create
     @cloud_account=CloudAccount.new(cloud_account_params)

     if @cloud_account.save

       flash[:notice] = "Subject created successfully"
       redirect_to(:action => 'index')
     else
       render('new')
     end
  end

  def edit
    @cloud_account=CloudAccount.find(params[:id])
  end

  def update
     @cloud_account=CloudAccount.find(params[:id])
     if @cloud_account.update_attributes(cloud_account_params)

      flash[:notice] = "Cloud Account updated successfully."
       redirect_to(:action => 'show', :id =>@cloud_account.id)
     else
       render('edit')
     end
  end




  def delete
   @cloud_account = CloudAccount.find(params[:id])
  end

  def destroy
    cloud_account = CloudAccount.find(params[:id])
    cloud_account.destroy
    flash[:notice] = "Cloud Account: '#{cloud_account.name}' destroyed successfully."
    redirect_to(:action => 'index')
  end


  private

  def cloud_account_params
    # same as using "params[:subject]",
    # - raises an error if :cloud_account is not prsent
    # - allows listed attributes to be mass- assigned
    params.require(:cloud_account).permit(:access_key_id, :cloud_provider, :name,:iam_role_arn, :secret_access_key, :access_method, :aws_cloud_partition, :external_id)
  end






end
