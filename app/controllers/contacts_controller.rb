class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:admin, :admin_this_month, :admin_this_month, :admin_last_month, :admin_this_year]
  before_action :authenticate_admin!, :only => [:admin, :admin_this_month, :admin_last_month, :admin_this_year]
  # GET /contacts
  # GET /contacts.json
  def index
          @contacts = current_user.contacts.order('eventdate DESC').paginate(:page => params[:page], :per_page => 30)
            respond_to do |format|
              format.html
              format.xls { send_data @contacts.to_csv(col_sep: "\t") }
     end
  end

  def last_month
            @contacts = current_user.contacts.in_last_month.paginate(:page => params[:page], :per_page => 10).order('eventdate DESC')
            respond_to do |format|
              format.html
              format.xls { send_data @contacts.to_csv(col_sep: "\t") }


     end
  end

  def this_month
            @contacts = current_user.contacts.this_month.paginate(:page => params[:page], :per_page => 10).order('eventdate DESC')
            respond_to do |format|
              format.html
              format.xls { send_data @contacts.to_csv(col_sep: "\t") }
     end
  end

  def this_year
            @contacts = current_user.contacts.this_year.paginate(:page => params[:page], :per_page => 10).order('eventdate DESC')
            respond_to do |format|
              format.html
              format.xls { send_data @contacts.to_csv(col_sep: "\t") }
     end
  end


  def admin
          @contacts = current_admin.contacts.order('eventdate DESC').paginate(:page => params[:page], :per_page => 30)
            respond_to do |format|
              format.html
              format.xls { send_data @contacts.to_csv(col_sep: "\t") }
          end
  end

  def admin_last_month
          @contacts = current_admin.contacts.in_last_month.paginate(:page => params[:page], :per_page => 10).order('eventdate DESC')
            respond_to do |format|
              format.html
              format.xls { send_data @contacts.to_csv(col_sep: "\t") }
          end

            @admin_contacts = current_admin
            @admin_contacts.contacts.in_last_month

  end

    def admin_this_month
          @contacts = current_admin.contacts.this_month.paginate(:page => params[:page], :per_page => 10).order('eventdate DESC')
            respond_to do |format|
              format.html
              format.xls { send_data @contacts.to_csv(col_sep: "\t") }
          end
            @admin_contacts = current_admin
            @admin_contacts.contacts.this_month
  end

    def admin_this_year
          @contacts = current_admin.contacts.this_year.paginate(:page => params[:page], :per_page => 10).order('eventdate DESC')
            respond_to do |format|
              format.html
              format.xls { send_data @contacts.to_csv(col_sep: "\t") }
          end
            @admin_contacts = current_admin
            @admin_contacts.contacts.this_year          
  end


  def show
  end

  # GET /contacts/new
  def new
    if admin_signed_in? 
        redirect_to contacts_admin_path
    else
        @contact = Contact.new
    end
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
        @contact = Contact.new(contact_params)
        @contact.user_id = current_user.id
        @contact.host_id = current_user.host_id
        @contact.user_name = current_user.name
        @contact.user_email = current_user.email
        respond_to do |format|
          if @contact.save
            format.html { redirect_to new_contact_path, notice: 'Your check-in has been saved. Thanks!' }
            format.json { render :show, status: :created, location: @contact }
          else
            format.html { render :new }
            format.json { render json: @contact.errors, status: :unprocessable_entity }
          end

    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to contacts_path, notice: 'Contact was successfully updated.' }
        format.json { render :index, status: :ok, location: contacts_path }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:contacttype, :company, :department, :person, :duration, :notes, :eventdate, :followup_at, :email, :admin_email)
    end
end
