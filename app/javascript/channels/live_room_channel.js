import consumer from "./consumer"

// URLからlive_room_idを取得する関数
function getLiveRoomIdFromUrl() {
  const url = window.location.pathname;
  const id = url.match(/live_rooms\/(\d+)/)[1];
  return id;
}

const liveRoomId = getLiveRoomIdFromUrl();  // URLからlive_room_idを取得

const App = {};  // Appオブジェクトを定義

App.room = consumer.subscriptions.create({ channel: "LiveRoomChannel", live_room_id: liveRoomId }, {
  connected() {
    console.log('Connected to LiveRoomChannel');
  },

  disconnected() {
    console.log('Disconnected from LiveRoomChannel');
  },

  received: function(message) {
    const messages = document.getElementById('messages');
    const ul = messages.querySelector('ul');
    ul.innerHTML += message;
  },

  speak: function(content) {
    return this.perform('speak', {message: content, live_room_id: liveRoomId});
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
