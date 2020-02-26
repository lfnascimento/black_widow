if Rails.env.development?
  user_1 = User.find_or_create_by(email: 'foo@mail.com') do |user|
    user.password = 'foo'
    user.password_confirmation = 'foo'
  end
  user_2 = User.find_or_create_by(email: 'bar@mail.com') do |user|
    user.password = 'bar'
    user.password_confirmation = 'bar'
  end
  Account.find_or_create_by(identification: 'Foo')  do |account|
    account.balance = BigDecimal('80.90')
    account.user = user_1
  end
  Account.find_or_create_by(identification: 'Bar') do |account|
    account.balance = BigDecimal('124.75')
    account.user = user_2
  end
end
