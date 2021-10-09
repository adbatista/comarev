require 'rails_helper'

describe CompanyPolicy do
  subject { CompanyPolicy.new(user, new_company) }

  let(:new_company) { build_stubbed(:company) }

  context 'for a regular user' do
    let(:user) { build_stubbed(:user) }

    it { is_expected.not_to authorize(:create) }
    it { is_expected.not_to authorize(:index) }
    it { is_expected.not_to authorize(:show) }
    it { is_expected.not_to authorize(:destroy) }
    it { is_expected.not_to authorize(:update) }
  end

  context 'for an admin user' do
    let(:user) { build_stubbed(:user, :admin) }

    it { is_expected.to authorize(:create) }
    it { is_expected.to authorize(:index) }
    it { is_expected.to authorize(:show) }
    it { is_expected.to authorize(:destroy) }
    it { is_expected.to authorize(:update) }
  end
end