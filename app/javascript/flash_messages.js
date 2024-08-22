document.addEventListener('DOMContentLoaded', () => {
  setTimeout(() => {
    const flashMessages = document.querySelectorAll('.alert');
    flashMessages.forEach(message => {
      message.style.opacity = '0';
      setTimeout(() => {
        message.remove();
      }, 500); // アニメーションの後に削除
    });
  }, 5000); // 5 秒後に処理を開始
});