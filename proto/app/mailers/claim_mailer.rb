class ClaimMailer < ApplicationMailer
  default from: 'noreply@example.com'

  def claim_accepted(member)
    @member = member
    mail(to: @member.email, subject: 'claim accepted')
  end

  def claim_approved(member)
    @member = member
    mail(to: @member.email, subject: 'claim approved')
  end

  def claim_paid(member)
    @member = member
    mail(to: @member.email, subject: 'claim paid')
  end

end
