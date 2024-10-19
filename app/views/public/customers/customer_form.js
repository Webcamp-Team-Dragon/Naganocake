document.addEventListener('DOMContentLoaded', function() {
  document.querySelector('form').addEventListener('submit', function(event) {
    event.preventDefault();

    let formData = new FormData(this);

    fetch(this.action, {
      method: 'PUT', // PATCH から PUT に変更
      body: formData
    })
    .then(response => {
      if (response.ok) {
        // 成功時の処理を記述（例: メッセージの表示、ページのリフレッシュなど）
      } else {
        // エラー時の処理を記述
      }
    })
    .catch(error => console.error('エラー:', error));
  });
});