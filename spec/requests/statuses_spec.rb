require 'rails_helper'

RSpec.describe "/statuses", type: :request do
  let(:valid_attributes) {
    {
      name: 'to do'
    }
  }

  let(:invalid_attributes) {
    {
      name: nil
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Status.create! valid_attributes
      get statuses_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      status = Status.create! valid_attributes
      get status_url(status)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_status_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      status = Status.create! valid_attributes
      get edit_status_url(status)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Status" do
        expect {
          post statuses_url, params: { status: valid_attributes }
        }.to change(Status, :count).by(1)
      end

      it "redirects to the created status" do
        post statuses_url, params: { status: valid_attributes }
        expect(response).to redirect_to(status_url(Status.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Status" do
        expect {
          post statuses_url, params: { status: invalid_attributes }
        }.to change(Status, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post statuses_url, params: { status: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          name: 'open'
        }
      }

      it "updates the requested status" do
        status = Status.create! valid_attributes
        patch status_url(status), params: { status: new_attributes }
        status.reload
        expect(status.name).to eq('open')
      end

      it "redirects to the status" do
        status = Status.create! valid_attributes
        patch status_url(status), params: { status: new_attributes }
        status.reload
        expect(response).to redirect_to(status_url(status))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        status = Status.create! valid_attributes
        patch status_url(status), params: { status: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested status" do
      status = Status.create! valid_attributes
      expect {
        delete status_url(status)
      }.to change(Status, :count).by(-1)
    end

    it "redirects to the statuses list" do
      status = Status.create! valid_attributes
      delete status_url(status)
      expect(response).to redirect_to(statuses_url)
    end
  end
end
