class ContactMailer < ApplicationMailer

  def contact_mail(contact)
    @contact = contact
    mail to: ENV['youhe0122@gmail.com'], subject: 'お問い合わせ'
  end
end
