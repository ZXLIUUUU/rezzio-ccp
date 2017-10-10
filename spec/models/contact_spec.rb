require 'rails_helper'

RSpec.describe Contact, type: :model do
  it { should have_valid(:first_name).when('Jon', 'Sally') }
  it { should_not have_valid(:first_name).when('', nil) }

  it { should have_valid(:last_name).when('Smith', 'Someone') }
  it { should_not have_valid(:last_name).when('', nil) }

  it { should have_valid(:email).when('someone@email.com', 'anyone@email.net') }
  it { should_not have_valid(:email).when('', nil, 'user', 'email@@com') }

  it { should have_valid(:info_request).when('General Information', 'Investment Opportunities', 'Student Information', 'Other') }
  it { should_not have_valid(:info_request).when('', nil) }
end
