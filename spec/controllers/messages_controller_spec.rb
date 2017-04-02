require "rails_helper"

RSpec.describe MessagesController do

  let(:current_user) {  User.new(dialect: "Yoda", username: "someuser") }

  describe "GET #index" do
    context "when user is verified" do
      before { allow(controller).to receive(:current_user) { current_user } }

      it "redirects to messages page" do
        get :index

        expect(response.status).to eq(200)
      end
    end

    context "when user is not verified" do
      before { allow(controller).to receive(:current_user) { nil } }

      it "does not creates a user session" do
        get :index

        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe "POST #dialect" do
    before do
      allow(controller).to receive(:current_user) { current_user }
      request.cookies[:dialect] = "Yoda"
    end

    it "changes the dialect for the current user" do
      post :dialect, params: { dialect: "Binary" }

      expect(current_user.dialect).to eq("Binary")
    end
  end

  describe "POST #create" do
    context "when user is verified" do
      before do
        allow(controller).to receive(:current_user) { current_user }
      end

      it "translates and sends message" do
        allow_any_instance_of(Translator).to receive(:translate_to).with(current_user.dialect).and_return("Hello. This is a test mesage for you.")
        allow(MessageBroadcast).to receive(:perform_later)

        post :create, params: { message: { content: "This is a test message, to test", dialect: current_user.dialect } }

        expect(MessageBroadcast).to have_received(:perform_later)
      end
    end

    context "when user is not verified" do
      before do
        allow(controller).to receive(:current_user) { nil }
      end

      it "translates and sends message" do
        allow(MessageBroadcast).to receive(:perform_later)

        post :create, params: { message: { content: "This is a test message, to test", dialect: "Yoda" } }

        expect(response.status).to eq(302)
        expect(response).to redirect_to(root_url)
        expect(MessageBroadcast).to_not have_received(:perform_later)
      end
    end
  end
end
