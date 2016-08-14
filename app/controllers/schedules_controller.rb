# require '../skejuler-aws/lib/skejuler/aws/rds.rb'
include IceCubeMethods


class SchedulesController < ApplicationController

  before_action :authenticate_user!

  def index
    @schedule = Schedule.all
  end

  def show
    @schedule = Schedule.find(params[:id])


  end

  def new
    @schedule = current_user.schedules.build #Schedule.new
  end

  def create
    @schedule = current_user.schedules.build(schedule_params)
    # @schedule.user = User.first
    respond_to do |format|
      if @schedule.save



        format.html { redirect_to @schedule, notice: 'Schedule was successfully created.' }

        action_value = @schedule.action

        sch_options

        case action_value
          when "start_rds"
            puts "starting rds"
            rdsstart
          when "stop_rds"
            puts "stopping rds"
            rdsstop
          when "start_ec2"
            puts "Starting Ec2"
            ec2start
          when "stop_ec2"
            puts "Stopping Ec2"
            ec2stop
          when "none"
          format.json { render :show, status: :created, location: @schedule }
      else
        format.html { render :new }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
    end
    end

  def edit
      @schedule=Schedule.find(params[:id])
  end


  def update
    respond_to do |format|
      @schedule=Schedule.find(params[:id])
      if @schedule.update(schedule_params)
        format.html { redirect_to @schedule, notice: 'Schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @schedule }
      else
        format.html { render :edit }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # @schedule.destroy
    @status_update = Schedule.find(params[:id])
    if @status_update.present?
      @status_update.destroy
    end
    flash[:notice] = "Schedule was successfully Deleted"
    respond_to do |format|
      format.html { redirect_to schedules_url, notice: 'Schedule was destroyed.' }
      format.json { head :no_content }
    # end
    # redirect_to root_path
    end
    end


def schedule_params
  params.require(:schedule).permit(:name, :remarks, :enabled, :dat_tme, :from_date, :from_time, :repeat, :occurs, :snapshotid, :snapshotname, :timezone, :repeatdays, :repeatweek, :weekdays,  :repeatmonth, :monthdays, :repeats_every_X_hour, :repeats_every_X_week, :cloud, :region, :action, :instanceid)
end






  def rdsstart

  rds = Aws::RDS::Resource.new(
      region: ENV['AWS_REGION'],
      access_key_id: ENV['AWS_API_KEY'],
      secret_access_key: ENV['AWS_SECRET_KEY']
  )
  # ::Skejuler::Aws::Rds::Mylog.start(rds,)

  # redirect_to root_path and return

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


  def sch_options

    if @schedule.repeat != false
      schedule = IceCube::Schedule.new(@schedule.dat_tme)
    end
      if @schedule.repeat == true
        schedule = IceCube::Schedule.new(@schedule.dat_tme)
        if @schedule.occurs == "daily"
          schedule.add_recurrence_rule IceCube::Rule.daily(@schedule.repeatdays)
          puts "schedules are"
          puts schedule.first(10)
        end
        if @schedule.occurs == "weekly"
          if @schedule.weekdays == 8
            schedule.add_recurrence_rule IceCube::Rule.weekly(@schedule.repeatweek)
        end
        if @schedule.weekdays != 8
          schedule.add_recurrence_rule IceCube::Rule.weekly(@schedule.repeatweek).day(@schedule.weekdays)
        end
          puts "schedules are"
          puts schedule.first(10)
        end
        if @schedule.occurs == "monthly"
          schedule.add_recurrence_rule IceCube::Rule.monthly(@schedule.repeatmonth)
          puts "schedules are"
          puts schedule.first(10)
        end

    end
  end
end
