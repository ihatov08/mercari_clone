class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.notify_ordered.subject
  #
  def notify_ordered(order)
    @order = order
    mail to: @order.payer.user.email,
         subject: "【URIKAI】#{@order.item.name}の発送をお願いします
         "
  end
end
