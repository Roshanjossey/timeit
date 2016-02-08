require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_db_column(:name).of_type(:string) }
  it { is_expected.to have_db_column(:email).of_type(:string) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to have_many (:entries) }
end
