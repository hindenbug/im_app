require 'rails_helper'

RSpec.describe Message do

  let(:content) { 'content' }
  let(:dialect) { 'Yoda' }
  let(:username) { 'someuser' }

  describe "validity" do

    subject(:message) { Message.new(content: content, dialect: dialect, username: username) }
    it { is_expected.to be_valid }

    context 'when no content present' do
      it "should be in valid" do
        message =  Message.new(content: '', dialect: dialect, username: username)

        expect(message).to be_invalid
      end
    end

    context 'when no dialecti selected' do
      it "should be invalid" do
        message =  Message.new(content: content, dialect: '', username: username)

        expect(message).to be_invalid
      end
    end

    context 'when no user present' do
      it "should be invalid" do
        message =  Message.new(content: content, dialect: dialect, username: nil)

        expect(message).to be_invalid
      end
    end

  end

  describe "#dialect_icon" do
    context 'when dialect is yoda' do
      it "should be return yoda icon name" do
        message =  Message.new(content: content, dialect: 'Yoda', username: username)

        expect(message.dialect_icon).to eq('yoda-dialect-icon')
      end
    end

    context 'when dialect is valley girl' do
      it "should be return valley girl icon name" do
        message =  Message.new(content: content, dialect: 'Valley Girl', username: username)

        expect(message.dialect_icon).to eq('valley-girl-dialect-icon')
      end
    end

    context 'when dialect is binary' do
      it "should be return valley girl icon name" do
        message =  Message.new(content: content, dialect: 'Binary', username: username)

        expect(message.dialect_icon).to eq('binary-dialect-icon')
      end
    end

  end
end
