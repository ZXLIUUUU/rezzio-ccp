class ContactsController < ApplicationController
  def index

  end

  def show
    @contact = Contact.find(params[:id])
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      ContactMailer.contact_signup(@contact).deliver_now
      flash[:success] = "Saved Successfully!"
      redirect_to @contact
    else
      flash[:danger] = "Something went wrong!"
      render :new
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])

    if @contact.update(contact_params)
      flash[:success] = "Updated Successfully!"
      redirect_to @contact
    else
      flash[:danger] = "Something went wrong!"
      render :edit
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :major, :student_number)
  end
end
