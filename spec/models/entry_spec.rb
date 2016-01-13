require 'rails_helper'

RSpec.describe Entry, type: :model do

  it { is_expected.to have_db_column(:date).of_type(:date) }
  it { is_expected.to have_db_column(:project).of_type(:string) }
  it { is_expected.to have_db_column(:duration).of_type(:float) }
  it { is_expected.to have_db_column(:billable).of_type(:boolean) }
  it { is_expected.to have_db_column(:description).of_type(:text) }
  it { is_expected.to belong_to :user }

  it { is_expected.to validate_presence_of(:date) }
  it { is_expected.to validate_presence_of(:project) }
  it { is_expected.to validate_presence_of(:duration) }
  it { is_expected.to validate_inclusion_of(:billable).in_array([true, false]) }

end
