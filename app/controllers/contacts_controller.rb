class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_email(@contact).deliver_now
      flash[:notice] = "お問い合わせが送信されました。"
      flash.delete(:alert) # エラーメッセージを削除
      redirect_to new_contact_path
    else
      flash[:alert] = "お問い合わせの送信に失敗しました。"
      render :new
      flash.delete(:alert) # エラーメッセージを削除
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
