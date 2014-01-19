class AttendanceListsController < ApplicationController

  before_filter :authenticate_member!

  # GET /attendance_lists
  # GET /attendance_lists.json
  def index

    #@attendance_lists = AttendanceList.all
    @schedules = Schedule.get_active_schedule()
    logger.debug(@schedules)

    @attendance_lists = Array.new
    @members = Member.where("status in (1,2)").order("id ASC").pluck(:id)
    @members.each{|mem_id|
      ## SELECT
      @attendance_list = AttendanceList.get_member_schedule(mem_id)
      @attendance_lists << @attendance_list
    }

    logger.debug(@attendance_lists)
#    @attendance_lists.each{|list|
#      list.each{|list2|
#        logger.debug(list2)
#      }
#    }

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @schedules }
      format.json { render json: @attendance_lists }
    end
  end

  # GET /attendance_lists/1
  # GET /attendance_lists/1.json
  def show
    @attendance_list = AttendanceList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @attendance_list }
    end
  end

  # GET /attendance_lists/new
  # GET /attendance_lists/new.json
  def new
    @attendance_list = AttendanceList.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @attendance_list }
    end
  end

  # GET /attendance_lists/1/edit
  def edit
    @attendance_list = AttendanceList.find(params[:id])
  end

  # POST /attendance_lists
  # POST /attendance_lists.json
  def create
    @attendance_list = AttendanceList.new(params[:attendance_list])

    respond_to do |format|
      if @attendance_list.save
        format.html { redirect_to @attendance_list, notice: 'Attendance list was successfully created.' }
        format.json { render json: @attendance_list, status: :created, location: @attendance_list }
      else
        format.html { render action: "new" }
        format.json { render json: @attendance_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /attendance_lists/1
  # PUT /attendance_lists/1.json
  def update
    @attendance_list = AttendanceList.find(params[:id])

    respond_to do |format|
      if @attendance_list.update_attributes(params[:attendance_list])
        format.html { redirect_to @attendance_list, notice: 'Attendance list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @attendance_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendance_lists/1
  # DELETE /attendance_lists/1.json
  def destroy
    @attendance_list = AttendanceList.find(params[:id])
    @attendance_list.destroy

    respond_to do |format|
      format.html { redirect_to attendance_lists_url }
      format.json { head :no_content }
    end
  end

end
