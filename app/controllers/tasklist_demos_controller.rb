class TasklistDemosController < ApplicationController
  # before_filter :login_required

  # GET /tasklist_demos
  # GET /tasklist_demos.xml
  def index
    if params[:filter] || session[:filter] == nil
      session[:filter] = (params[:filter] ? params[:filter] : "Active")
    end

    if session[:filter] == "Active"
      @tasklist_demos = TasklistDemo.find(:all, 
                                          :conditions => ["status != 'Closed' or status is null"],
                                          :order => "assignee DESC, deadline ASC")
    else
      @tasklist_demos = TasklistDemo.find(:all, 
                                          :conditions => ["status = '" + session[:filter] + "'"],
                                          :order => "updated_at ASC")
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tasklist_demos }
    end
  end

  # GET /tasklist_demos/1
  # GET /tasklist_demos/1.xml
  def show
    @tasklist_demo = TasklistDemo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tasklist_demo }
    end
  end

  # GET /tasklist_demos/new
  # GET /tasklist_demos/new.xml
  def new
    @tasklist_demo = TasklistDemo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tasklist_demo }
    end
  end

  # GET /tasklist_demos/1/edit
  def edit
    @tasklist_demo = TasklistDemo.find(params[:id])
  end

  def done_submit_template
    tasklist_demo = TasklistDemo.find(params[:id])
    change_status(tasklist_demo, "", "Submit Template")
    redirect_to :back
  end

  def done_check_on_test
    tasklist_demo = TasklistDemo.find(params[:id])
    change_status(tasklist_demo, "", "Checked Test Env")
    redirect_to :back
  end

  def done_check_on_prod
    tasklist_demo = TasklistDemo.find(params[:id])
    change_status(tasklist_demo, "", "Checked Prod Env")
    redirect_to :back
  end

  def done_broker_test
    tasklist_demo = TasklistDemo.find(params[:id])
    change_status(tasklist_demo, "", "Complete Broker Test")
    redirect_to :back
  end

  def close
    tasklist_demo = TasklistDemo.find(params[:id])
    change_status(tasklist_demo, "Closed")
    redirect_to :back
  end

  def reopen
    tasklist_demo = TasklistDemo.find(params[:id])
    change_status(tasklist_demo, "Reopend")
    redirect_to :back
  end

  # POST /tasklist_demos
  # POST /tasklist_demos.xml
  def create
    params[:tasklist_demo][:registered] ||= DateTime.now
    params[:tasklist_demo][:created_by] ||= request.env["REMOTE_ADDR"]
    @tasklist_demo = TasklistDemo.new(params[:tasklist_demo])

    respond_to do |format|
      archive(@tasklist_demo)
      if @tasklist_demo.save
        flash[:notice] = 'TasklistDemo was successfully created.'
        format.html { redirect_to(@tasklist_demo) }
        format.xml  { render :xml => @tasklist_demo, :status => :created, :location => @tasklist_demo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tasklist_demo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tasklist_demos/1
  # PUT /tasklist_demos/1.xml
  def update
    params[:tasklist_demo].store("updated_by", request.env["REMOTE_ADDR"])
    @tasklist_demo = TasklistDemo.find(params[:id])

    respond_to do |format|
      archive(@tasklist_demo)
      if @tasklist_demo.update_attributes(params[:tasklist_demo])
        flash[:notice] = 'TasklistDemo was successfully updated.'
        format.html { redirect_to(@tasklist_demo) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tasklist_demo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tasklist_demos/1
  # DELETE /tasklist_demos/1.xml
  def destroy
    @tasklist_demo = TasklistDemo.find(params[:id])
    @tasklist_demo.destroy

    respond_to do |format|
      format.html { redirect_to(tasklist_demos_url) }
      format.xml  { head :ok }
    end
  end

  private
  def archive(tasklist_demo)
    if tasklist_demo[:id] != nil
      tasklist_archive = TasklistArchive.new(tasklist_demo.attributes)
      tasklist_archive.tasklist_demo = tasklist_demo
      tasklist_archive.save
    end
  end

  def change_status(tasklist_demo, status, statustext = status)
    archive(tasklist_demo)
    tasklist_demo.status = status if status
    tasklist_demo.updated_by = request.env["REMOTE_ADDR"]
    if tasklist_demo.statustext?
      tasklist_demo.statustext = tasklist_demo.statustext + "\r\n" + statustext + " " + DateTime.now.strftime("%Y/%m/%d %H:%M") + " (" + tasklist_demo.updated_by + ")"
    else
      tasklist_demo.statustext = statustext + " " + DateTime.now.strftime("%Y/%m/%d %H:%M") + " (" + tasklist_demo.updated_by + ")"
    end
    tasklist_demo.save
  end

end
