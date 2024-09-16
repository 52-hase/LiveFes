document.addEventListener('DOMContentLoaded', function() {
  const shareButton = document.getElementById('share-button');
  const liveRoomName = shareButton.getAttribute('data-room-name');  // データ属性からルーム名を取得
  const appUrl = `https://www.live-fes.com${shareButton.getAttribute('data-room-url')}`;  // URLを取得

  document.getElementById('share-to-x').addEventListener('click', function() {
    const text = `${encodeURIComponent(liveRoomName)}%20のライブルームで思い出を共有しよう！%20%23Live_Fes%20%0a`;  // 名前をエンコード
    const url = `https://x.com/intent/tweet?text=${text}&url=${encodeURIComponent(appUrl)}`;  // URLもエンコード

    window.open(url, "_blank");
  });
});
