class ContactMailer < ApplicationMailer
  def contact_signup(contact)
    @contact = contact

    mail(to: contact.email, subject: "Thank You for your interest in Rezzio")
  end
end
