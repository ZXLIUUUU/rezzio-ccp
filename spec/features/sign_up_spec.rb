require 'rails_helper'

feature "Contact signs up with the form" do
  scenario "specifies vaild and required information" do
    visit new_contact_path

    fill_in 'First Name', with: 'Jon'
    fill_in 'Last Name', with: 'Smith'
    fill_in 'Email', with: 'user@email.com'
    select('Investment Opportunities', :from => 'Requested Information')
    click_button 'Sign Up'

    expect(page).to have_content("Thanks for signing up Jon!")
    expect(page).to have_content("Check your inbox for an Email regarding Investment Opportunities with Rezzio")
    expect(page).to_not have_content("Sign Up")
  end

  scenario "selects Student Information from drop down" do
    visit new_contact_path

    fill_in 'First Name', with: 'Jon'
    fill_in 'Last Name', with: 'Smith'
    fill_in 'Email', with: 'user@email.com'
    select('Student Information', :from => 'Requested Information')
    click_button 'Sign Up'

    expect(page).to have_content("Thanks for signing up Jon!")
    expect(page).to have_content("Check your inbox for an Email regarding Student Information")
    expect(page).to_not have_content("Sign Up")
  end

  scenario "selects Other from drop down" do
    visit new_contact_path

    fill_in 'First Name', with: 'Jon'
    fill_in 'Last Name', with: 'Smith'
    fill_in 'Email', with: 'user@email.com'
    select('Student Information', :from => 'Requested Information')
    click_button 'Sign Up'

    expect(page).to have_content("Thanks for signing up Jon!")
    expect(page).to have_content("Check your inbox for an Email with information about Rezzio")
    expect(page).to_not have_content("Sign Up")
  end

  scenario "selects General Information from drop down" do
    visit new_contact_path

    fill_in 'First Name', with: 'Jon'
    fill_in 'Last Name', with: 'Smith'
    fill_in 'Email', with: 'user@email.com'
    select('General Information', :from => 'Requested Information')
    click_button 'Sign Up'

    expect(page).to have_content("Thanks for signing up Jon!")
    expect(page).to have_content("Check your inbox for an Email regarding General Information about Rezzio")
    expect(page).to_not have_content("Sign Up")
  end

  scenario "does not select from drop down" do
    visit new_contact_path

    fill_in 'First Name', with: 'Jon'
    fill_in 'Last Name', with: 'Smith'
    fill_in 'Email', with: 'user@email.com'
    click_button 'Sign Up'

    expect(page).to have_content("Thanks for signing up Jon!")
    expect(page).to have_content("Check your inbox for an Email with information about Rezzio")
    expect(page).to_not have_content("Sign Up")
  end

  scenario "required information is not supplied" do
    visit new_contact_path

    fill_in 'First Name', with: 'Jon'
    fill_in 'Last Name', with: 'Smith'

    click_button 'Sign Up'

    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content("Thanks for signing up Jon!")
    expect(page).to_not have_content("Check your inbox for an Email with information about Rezzio")
  end

  scenario "an email is not supplied in the correct format" do
    visit new_contact_path

    fill_in 'First Name', with: 'Jon'
    fill_in 'Last Name', with: 'Smith'
    fill_in 'Email', with: 'userATemail.com'

    click_button 'Sign Up'

    expect(page).to have_content("is invalid")
    expect(page).to_not have_content("Thanks for signing up Jon!")
    expect(page).to_not have_content("Check your inbox for an Email with information about Rezzio")
  end
end
