import consumer from "./consumer"

// URLからlive_room_idを取得する関数
function getLiveRoomIdFromUrl() {
  const url = window.location.pathname;
  const match = url.match(/live_rooms\/(\d+)/);
  return match ? match[1] : null;
}

// ログイン中のユーザーIDを取得する関数（例として）
function getUserId() {
  const userIdElement = document.getElementById('user-id');
  return userIdElement ? userIdElement.dataset.userId : null;
}

const liveRoomId = getLiveRoomIdFromUrl();  // URLからlive_room_idを取得
const userId = getUserId();  // ユーザーIDを取得

const App = {};  // Appオブジェクトを定義

if (liveRoomId) {
  App.room = consumer.subscriptions.create({ channel: "LiveRoomChannel", live_room_id: liveRoomId }, {
    connected() {
      console.log('Connected to LiveRoomChannel');
    },

    disconnected() {
      console.log('Disconnected from LiveRoomChannel');
    },

    received: function(message) {
      const messages = document.getElementById('messages');
      if (messages) {
        const ul = messages.querySelector('ul');
        if (ul) {
          ul.innerHTML += message;
        }
      }
    },

    speak: function(content) {
      return this.perform('speak', {message: content, live_room_id: liveRoomId, user_id: userId});
    }
  });

  document.addEventListener('DOMContentLoaded', function() {
    const input = document.getElementById('chat-input');
    const button = document.getElementById('button');
    button.addEventListener('click', function() {
      const content = input.value;
      App.room.speak(content);
      input.value = '';
    });
  });
}