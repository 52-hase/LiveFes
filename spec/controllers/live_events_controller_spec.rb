# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LiveEventsController, type: :controller do
  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a successful response" do
      live_event = LiveEvent.create!(title: "Test Event")
      get :show, params: { id: live_event.id }
      expect(response).to be_successful
    end
  end
end