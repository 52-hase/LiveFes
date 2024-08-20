class ContactMailer < ApplicationMailer
  default to: 'app.live.chat.oo@gmail.com'

  def contact_email(contact)
    @contact = contact
    mail(subject: '新しいお問い合わせ')
  end
end
