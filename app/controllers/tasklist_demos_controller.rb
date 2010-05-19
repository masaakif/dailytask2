class TasklistDemosController < ApplicationController
  # GET /tasklist_demos
  # GET /tasklist_demos.xml
  def index
    if params == nil or params[:filter] == nil
      @tasklist_demos = TasklistDemo.find(:all, :conditions => ["status != 'Closed' or status is null"],
                                         :order => "assignee DESC")
      @filter = "Active"
    else
      puts params[:filter]
      @tasklist_demos = TasklistDemo.find(:all, :conditions => ["status = '" + params[:filter] + "'"],
                                         :order => "assignee DESC")
      @filter = "Active"
      @filter = "Closed"
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

  def change_status(tasklist_demo, status)
    tasklist_demo.status = status
    if tasklist_demo.statustext != nil
      tasklist_demo.statustext = tasklist_demo.statustext + " " + status + " " + DateTime.now.strftime("%Y/%m/%d %H:%M")
    else
      tasklist_demo.statustext = status + " " + DateTime.now.strftime("%Y/%m/%d %H:%M")
    end
    tasklist_demo.save
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
    if params[:tasklist_demo][:registered] == nil
      params[:tasklist_demo].store("registered", DateTime.now)
    end
    @tasklist_demo = TasklistDemo.new(params[:tasklist_demo])

    respond_to do |format|
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
    @tasklist_demo = TasklistDemo.find(params[:id])

    respond_to do |format|
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
end
