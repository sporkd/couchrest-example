class AddressesController < ApplicationController
  
  helper_method :user

  # GET /addresses/1
  # GET /addresses/1.xml
  def show
    puts "USER is #{user.inspect}"
    @address = user.address

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @address }
    end
  end

  # GET /addresses/new
  # GET /addresses/new.xml
  def new
    @address = Address.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @address }
    end
  end

  # GET /addresses/1/edit
  def edit
    @address = user.address
  end

  # POST /addresses
  # POST /addresses.xml
  def create
    @address = Address.new(params[:address])
    user.address = @address

    respond_to do |format|
      if user.save
        flash[:notice] = 'Address was successfully created.'
        format.html { redirect_to(user) }
        format.xml  { render :xml => @address, :status => :created, :location => @address }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @address.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /addresses/1
  # PUT /addresses/1.xml
  def update
    @address = user.address
    @address.attributes = params[:address]
    
    respond_to do |format|
      if user.save
        flash[:notice] = 'Address was successfully updated.'
        format.html { redirect_to(user) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @address.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.xml
  def destroy
    user.address = nil
    user.save

    respond_to do |format|
      format.html { redirect_to(user) }
      format.xml  { head :ok }
    end
  end
  
  protected
  
  def user
    @user ||= User.get(params[:id] || params[:user_id])
  end
end
