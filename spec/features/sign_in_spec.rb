require 'rails_helper'

feature 'Sign in', :devise do

  scenario 'user cannot sign in if not registered' do
    sign_in('unsignup@email.com', 'unsignuppassword')
    expect(page).to have_content I18n.t 'devise.failure.not_found_in_database', authentication_keys: 'email'
  end

  scenario 'user can sign in with valid credentials' do
    user = create(:user)
    sign_in(user.email, user.password)
    expect(page).to have_content I18n.t 'devise.sessions.signed_in'
  end

  scenario 'user cannot sign in with wrong email' do
    user = create(:user)
    sign_in('invalid@email.com', user.password)
    expect(page).to have_content I18n.t 'devise.failure.not_found_in_database', authentication_keys: 'email'
  end

  scenario 'user cannot sign in with wrong password' do
    user = create(:user)
    sign_in(user.email, 'invalidpassword')
    expect(page).to have_content I18n.t 'devise.failure.invalid', authentication_keys: 'email'
  end
end
