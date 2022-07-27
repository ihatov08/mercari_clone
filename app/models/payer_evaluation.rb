class PayerEvaluation < Evaluation
  validates :received, acceptance: { message: "にチェックを入れてください" }
end
