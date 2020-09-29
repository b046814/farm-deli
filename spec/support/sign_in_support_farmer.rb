module SignInSupportFarmer
  def sign_in_farmer(farmer)
    visit new_farmer_session_path
    fill_in 'farmer_email', with: farmer.email
    fill_in 'farmer_password', with: farmer.password
    click_on('Log in')
    expect(current_path).to eq root_path
  end
end