class SchedulesController < ApplicationController

  before_action :authenticate_user!

  def index
    @schedule = Schedule.all
  end

  def show
    @schedule = Schedule.find(params[:id])

  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)

    respond_to do |format|
      if @schedule.save
        format.html { redirect_to @schedule, notice: 'Schedule was successfully created.' }
        format.json { render :show, status: :created, location: @schedule }
      else
        format.html { render :new }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @dchedule.update(contact_params)
        format.html { redirect_to @schedule, notice: 'Schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @schedule }
      else
        format.html { render :edit }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

private

def schedule_params
  params.require(:schedule).permit(:name, :dbinstanceid, :snapshotid, :snapshotname)
end

  def rdsstart

  rds = Aws::RDS::Resource.new(
      region: ENV['AWS_REGION'],
      access_key_id: ENV['AWS_API_KEY'],
      secret_access_key: ENV['AWS_SECRET_KEY']
  )


  ::Skejuler::Aws::Rds::Mylog.start(rds)
  # Rails.logger.info "My info log"

  redirect_to root_path

end

def rdsstop

  rds = Aws::RDS::Resource.new(
      region: ENV['AWS_REGION'],
      access_key_id: ENV['AWS_API_KEY'],
      secret_access_key: ENV['AWS_SECRET_KEY']
  )
  logger.debug rds.inspect
  ::Skejuler::Aws::Rds::Mylog.stop(rds)
  redirect_to root_path
end

def ec2start
  ec2_client = Aws::EC2::Client.new(
      region: ENV['AWS_REGION'],
      access_key_id: ENV['AWS_API_KEY'],
      secret_access_key: ENV['AWS_SECRET_KEY']
  )

  ::Skejuler::Aws::Rds::Mylog.start(ec2_client)
  redirect_to root_path
end

def ec2stop
  ec2_client = Aws::EC2::Client.new(
      region: ENV['AWS_REGION'],
      access_key_id: ENV['AWS_API_KEY'],
      secret_access_key: ENV['AWS_SECRET_KEY']
  )

  ::Skejuler::Aws::Rds::Mylog.stop(ec2_client)
  redirect_to root_path
end

end

