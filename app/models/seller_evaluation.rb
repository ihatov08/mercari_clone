class SellerEvaluation < Evaluation
  def reviewer
    order.item.user
  end
end
