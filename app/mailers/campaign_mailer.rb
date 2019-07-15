class CampaignMailer < ApplicationMailer

  def raffle(campaign, member, friend)
    @campaign = campaign
    @member = member
    @friend = friend
    mail to: @member.email, subject: "Nosso Amigo Secreto: #{@campaign.title}"
  end

  def error_raffle(campaign)
    @campaign = campaign
    mail to: @campaign.user.email, subject: "Nosso Amigo Secreto: problemas no sorteio da campanha #{@campaign.title}"
  end
end