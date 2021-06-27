class ContactsController < ApplicationController

  def index
    @contacts = Contact.all.order(created_at: :desc)
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver
      redirect_to request.referer
      flash[:notice] = "お問合せありがとうございました。"
    else
      render :new
    end
  end

  def update
    @contact =Contact.find(params[:id])
    @contact.update(is_deleted: true)
    redirect_to request.referer
  end
  private

  def contact_params
    params.require(:contact).permit(:name, :email, :body)
  end
end
