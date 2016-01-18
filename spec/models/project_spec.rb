require "rails_helper"

RSpec.describe Project, type: :model do
  it { is_expected.to have_db_column(:name).of_type(:string) }
  it { is_expected.to have_db_column(:billable).of_type(:boolean) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:billable) }


  it { is_expected.to have_many (:entries) }
end
