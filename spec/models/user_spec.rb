require 'rails_helper'

RSpec.describe User do

  let(:id) { SecureRandom.uuid }
  let(:dialect) { 'yoda' }
  let(:username) { 'someuser' }

  describe "validity" do

    subject(:user) { User.new(id: id, dialect: dialect, username: username) }
    it { is_expected.to be_valid }

    context 'when no username provided' do
      it "should be in valid" do
        user = User.new(dialect: dialect, username: '')

        expect(user).to be_invalid
      end
    end

    context 'when no dialect selected' do
      it "should be invalid" do
        user = User.new(dialect: '', username: username)

        expect(user).to be_invalid
      end
    end

    context 'when no id present' do
      it "should be valid" do
        user = User.new(dialect: dialect, username: username)

        expect(user).to be_valid
      end
    end

  end
end
