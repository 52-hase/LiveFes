# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LiveRoomChannel, type: :channel do

  # テストで使用するユーザーとライブルームをFactoryBotで作成
  let(:user) { create(:user) }
  let(:live_room) { create(:live_room) }

  # 各テストの前に実行される処理（テスト用のWebSocket接続をスタブ化し、current_userを設定）
  before do
    stub_connection current_user: user
  end

  # subscribeメソッドのテスト
  describe '#subscribed' do
    # ライブルームのストリームが正しく接続できること
    it 'subscribes to a stream for the live room' do
      # 指定したライブルームIDでチャンネルを閲覧
      subscribe(live_room_id: live_room.id)
      # 接続が確認されていくことの確認
      expect(subscription).to be_confirmed
      # 指定したライブルームのストリームを監視していくことの確認
      expect(subscription).to have_stream_for(live_room)
    end
  end

  # speakメソッドのテスト
  describe '#speak' do
    # チャットメッセージを送信するケース
    context 'with text message' do
      # チャットメッセージのパラメーターを設定
      let(:message_params) do
        {
          live_room_id: live_room.id,
          user_id: user.id,
          message: 'これはテストです。'
        }
      end
  
      # メッセージが新規作成されることを確認
      it 'create a new message' do
        expect {
          # speakメソッドを実行する
          subscription.speak(message_params)
          # Messageテーブルのレコード数が１増えることの確認
        }.to change(Message, :count).by(1)
      end
  
      # メッセージがブロードキャストされることを確認
      it 'broadcasts the message' do
        expect {
          # speakメソッドを実行
          subscription.speak(message_params)
          # ライブルームにメッセージがブロードキャストされることを確認
        }.to have_broadcasted_to(live_room)
      end
    end
  
    # 画像付きメッセージを送信するケース
    context 'with image message' do
      # テスト用の画像ファイルをBase64エンコード
      let(:image_base64) { Base64.encode64(File.read('spec/fixtures/test_image.png')) }
      # 画像付きメッセージのパラメータを設定
      let(:message_params) do
        {
          live_room_id: live_room.id,
          user_id: user.id,
          message: '',
          image: image_base64
        }
      end
    
      # 画像付きメッセージが作成されていることを確認
      it 'creates a message with an attached image' do
        expect{
          # speakメソッドを実行する
          subscription.speak(message_params)
          # Messageテーブルのレコード数が１増えることを確認
        }.to change(Message, :count).by(1)
        # 作成されたメッセージを取得
        message = Message.last
        # メッセージに画像が添付されていくことを確認
        expect(message.image).to be_attached
      end
    end
  end
end
