require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe PushTokensController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # PushToken. As you add validations to PushToken, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PushTokensController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all push_tokens as @push_tokens" do
      push_token = PushToken.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:push_tokens)).to eq([push_token])
    end
  end

  describe "GET show" do
    it "assigns the requested push_token as @push_token" do
      push_token = PushToken.create! valid_attributes
      get :show, {:id => push_token.to_param}, valid_session
      expect(assigns(:push_token)).to eq(push_token)
    end
  end

  describe "GET new" do
    it "assigns a new push_token as @push_token" do
      get :new, {}, valid_session
      expect(assigns(:push_token)).to be_a_new(PushToken)
    end
  end

  describe "GET edit" do
    it "assigns the requested push_token as @push_token" do
      push_token = PushToken.create! valid_attributes
      get :edit, {:id => push_token.to_param}, valid_session
      expect(assigns(:push_token)).to eq(push_token)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new PushToken" do
        expect {
          post :create, {:push_token => valid_attributes}, valid_session
        }.to change(PushToken, :count).by(1)
      end

      it "assigns a newly created push_token as @push_token" do
        post :create, {:push_token => valid_attributes}, valid_session
        expect(assigns(:push_token)).to be_a(PushToken)
        expect(assigns(:push_token)).to be_persisted
      end

      it "redirects to the created push_token" do
        post :create, {:push_token => valid_attributes}, valid_session
        expect(response).to redirect_to(PushToken.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved push_token as @push_token" do
        post :create, {:push_token => invalid_attributes}, valid_session
        expect(assigns(:push_token)).to be_a_new(PushToken)
      end

      it "re-renders the 'new' template" do
        post :create, {:push_token => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested push_token" do
        push_token = PushToken.create! valid_attributes
        put :update, {:id => push_token.to_param, :push_token => new_attributes}, valid_session
        push_token.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested push_token as @push_token" do
        push_token = PushToken.create! valid_attributes
        put :update, {:id => push_token.to_param, :push_token => valid_attributes}, valid_session
        expect(assigns(:push_token)).to eq(push_token)
      end

      it "redirects to the push_token" do
        push_token = PushToken.create! valid_attributes
        put :update, {:id => push_token.to_param, :push_token => valid_attributes}, valid_session
        expect(response).to redirect_to(push_token)
      end
    end

    describe "with invalid params" do
      it "assigns the push_token as @push_token" do
        push_token = PushToken.create! valid_attributes
        put :update, {:id => push_token.to_param, :push_token => invalid_attributes}, valid_session
        expect(assigns(:push_token)).to eq(push_token)
      end

      it "re-renders the 'edit' template" do
        push_token = PushToken.create! valid_attributes
        put :update, {:id => push_token.to_param, :push_token => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested push_token" do
      push_token = PushToken.create! valid_attributes
      expect {
        delete :destroy, {:id => push_token.to_param}, valid_session
      }.to change(PushToken, :count).by(-1)
    end

    it "redirects to the push_tokens list" do
      push_token = PushToken.create! valid_attributes
      delete :destroy, {:id => push_token.to_param}, valid_session
      expect(response).to redirect_to(push_tokens_url)
    end
  end

end
