class PayerEvaluation < Evaluation
  validates :received, acceptance: { message: "にチェックを入れてください" }

  def reviewer
    order.user
  end
end
