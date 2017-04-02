require "rails_helper"
require "fakeredis"

RSpec.describe SessionsController do

  before do
    $redis = Redis.new
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a user session" do
        post :create, params: { session: { username: "someuser", dialect: "Yoda" } }

        expect(cookies.signed[:username]).to eq("someuser")
        expect(cookies.signed[:dialect]).to eq("Yoda")
        expect(response).to redirect_to(messages_path)
        expect($redis.hget("user:#{cookies.signed[:user_id]}", "username")).to eq "someuser"
      end
    end

    context "with invalid params" do
      it "does not creates a user session" do
        post :create, params: { session: { username: nil, dialect: "Yoda" } }

        expect(response).to redirect_to(messages_path)
        expect(cookies[:username]).to be_nil
        expect(cookies[:dialect]).to be_nil
      end
    end
  end

  describe "POST #destroy" do
    before do
      request.cookies[:username] = "Some user"
      request.cookies[:dialect] = "Yoda"
    end

    it "destroys the current session and cookies" do
      post :destroy

      expect(cookies.signed[:username]).to be_nil
      expect(cookies.signed[:dialect]).to be_nil
      expect(response).to redirect_to(new_sessions_path)
    end
  end
end
