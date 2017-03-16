class UserMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def receipt_email(order)
    @order = order
    mail(to: 'robert_canas@hotmail.com', subject: "Jungle Purchase, Order ID: #{@order.id}")
  end

end
