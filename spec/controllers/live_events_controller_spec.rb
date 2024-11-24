# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LiveEventsController, type: :controller do
  # テスト対象のクラスとして LiveEventsController を指定し、RSpec でコントローラのテストを行う

  describe "GET #index" do
    # index アクションのテストに関する記述

    it "returns a successful response" do
      # index アクションをリクエストした際に、レスポンスが成功 (200 OK) を返すことを確認する
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    # show アクションのテストに関する記述

    it "returns a successful response" do
      # テスト用の LiveEvent レコードを作成
      live_event = create(:live_event)

      # 作成したレコードの ID を使って show アクションをリクエスト
      get :show, params: { id: live_event.id }

      # show アクションのレスポンスが成功 (200 OK) を返すことを確認する
      expect(response).to be_successful
    end
  end
end
