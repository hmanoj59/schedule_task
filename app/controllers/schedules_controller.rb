require '/Users/hotas/Desktop/skejuler-aws/lib/skejuler/aws/rds.rb'


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

        rdsstart and return
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

  def destroy
    @schedule.destroy
    respond_to do |format|
      format.html { redirect_to schedules_url, notice: 'Schedule was destroyed.' }
      format.json { head :no_content }
    end
  end


def schedule_params
  params.require(:schedule).permit(:name, :remarks, :enabled, :from_date, :from_time, :repeat, :to_date, :to_time, :snapshotid, :snapshotname, :repeats_every_n_days, :repeats_every_n_weeks, :repeats_weekly_each_days_of_the_week_mask, :repeats_every_n_months, :repeats_monthly, :repeats_monthly_each_days_of_the_month_mask, :repeats_monthly_on_ordinals_mask, :repeats_monthly_on_days_of_the_week_mask, :repeats_every_n_years, :repeats_yearly_each_months_of_the_year_mask, :repeats_yearly_on, :repeats_yearly_on_ordinals_mask, :repeats_yearly_on_days_of_the_week_mask )
end

  def rdsstart

  rds = Aws::RDS::Resource.new(
      region: ENV['AWS_REGION'],
      access_key_id: ENV['AWS_API_KEY'],
      secret_access_key: ENV['AWS_SECRET_KEY']
  )
  # ::Skejuler::Aws::Rds::Mylog.start(rds,)

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

