# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LiveRoomsController, type: :controller do
  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new live room' do
        expect {
          post :create, params: { live_room: { name: 'New Live Room' } }
        }.to change(LiveRoom, :count).by(1)  # 新しいルームが1つ増えることを確認
      end

      it 'redirects to the new live room' do
        post :create, params: { live_room: { name: 'New Live Room' } }
        expect(response).to redirect_to(LiveRoom.last)  # 作成したルームの詳細ページにリダイレクトされることを確認
      end

      it 'sets a flash notice' do
        post :create, params: { live_room: { name: 'New Live Room' } }
        expect(flash[:notice]).to eq('ルームが作成されました。')  # フラッシュメッセージの確認
      end
    end

    context 'with invalid params' do
      it 'does not create a live room' do
        expect {
          post :create, params: { live_room: { name: '' } }  # 無効な名前を送信
        }.to change(LiveRoom, :count).by(0)  # ルームの数が増えないことを確認
      end
    end
  end
end