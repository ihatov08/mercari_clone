class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.notify_ordered.subject
  #
  def notify_ordered(order)
    @order = order
    mail to: @order.user.email,
         subject: "【URIKAI】#{@order.item.name}の発送をお願いします
         "
  end

  def notify_comment(comment)
    @comment = comment
    mail to: comment.item.user.email,
         subject: "【URIKAI】#{comment.item.name}にコメントがありました"
  end

  def notify_message(message)
    @message = message

    mail to: message.recipient.email,
          subject: "【URIKAI】#{message.order.item.name}に取引メッセージがありました"
  end
end
