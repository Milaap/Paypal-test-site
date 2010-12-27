class PaymentNotificationsController < ApplicationController

  protect_from_forgery :except => [:create]
  
  # GET /payment_notifications
  # GET /payment_notifications.xml
  def index
    @payment_notifications = PaymentNotification.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @payment_notifications }
    end
  end

  # GET /payment_notifications/1
  # GET /payment_notifications/1.xml
  def show
    @payment_notification = PaymentNotification.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @payment_notification }
    end
  end

  # GET /payment_notifications/new
  # GET /payment_notifications/new.xml
  def new
    @payment_notification = PaymentNotification.new()

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @payment_notification }
    end
  end

  # GET /payment_notifications/1/edit
  def edit
    @payment_notification = PaymentNotification.find(params[:id])
  end

  # POST /payment_notifications
  # POST /payment_notifications.xml
  def create
    @payment_notification = PaymentNotification.new(params[:payment_notification])
    puts "---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
    render :nothing => true
  end

  # PUT /payment_notifications/1
  # PUT /payment_notifications/1.xml
  def update
    @payment_notification = PaymentNotification.find(params[:id])

    respond_to do |format|
      if @payment_notification.update_attributes(params[:payment_notification])
        format.html { redirect_to(@payment_notification, :notice => 'Payment notification was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @payment_notification.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /payment_notifications/1
  # DELETE /payment_notifications/1.xml
  def destroy
    @payment_notification = PaymentNotification.find(params[:id])
    @payment_notification.destroy

    respond_to do |format|
      format.html { redirect_to(payment_notifications_url) }
      format.xml  { head :ok }
    end
  end
end
