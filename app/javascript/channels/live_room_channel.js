import consumer from "./consumer"

// URLからlive_room_idを取得する関数
function getLiveRoomIdFromUrl() {
  const url = window.location.pathname;
  const match = url.match(/live_rooms\/(\d+)/);
  return match ? match[1] : null;
}

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
  
    speak: function(content, image = null) {
      return this.perform('speak', { message: content, image: image, live_room_id: liveRoomId, user_id: userId });
    }  
  });
  
  document.addEventListener('DOMContentLoaded', function() {
    const input = document.getElementById('chat-input');
    const imageInput = document.getElementById('chat-image');
    const button = document.getElementById('button');
    const chatImageLabel = document.getElementById('chat-image-label');
  
    // 画像が選択されたときにラベルを更新する
    imageInput.addEventListener('change', function() {
      if (imageInput.files.length > 0) {
        chatImageLabel.textContent = '画像が添付されています';
      } 
    });
  
    button.addEventListener('click', function() {
      const content = input.value;
      const file = imageInput.files[0];

      if (file) {
        const reader = new FileReader();
        reader.onload = function(event) {
          const base64String = event.target.result.split(',')[1];
          App.room.speak(content, base64String);
        };
        reader.readAsDataURL(file);
      } else {
        App.room.speak(content);
      }

      input.value = '';
      imageInput.value = '';
      chatImageLabel.textContent = '画像';  // 入力をクリアした後、ラベルを画像に戻す
    });
  });
}  