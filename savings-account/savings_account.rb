module SavingsAccount
  INTEREST_RATE_NEGATIVE_BALANCE = 3.213
  INTEREST_RATE_LESS_THAN_1000 = 0.5
  INTEREST_RATE_LESS_THAN_5000 = 1.621
  INTEREST_RATE_GREATER_THAN_5000 = 2.475

  def self.interest_rate(balance)
    if balance.negative?
      INTEREST_RATE_NEGATIVE_BALANCE
    elsif balance < 1000
      INTEREST_RATE_LESS_THAN_1000
    elsif balance < 5000
      INTEREST_RATE_LESS_THAN_5000
    else
      INTEREST_RATE_GREATER_THAN_5000
    end
  end

  def self.annual_balance_update(balance)
    balance + (balance * interest_rate(balance) / 100)
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
    years = 0
    until current_balance >= desired_balance
      current_balance = annual_balance_update(current_balance)
      years += 1
    end
    years
  end
end
