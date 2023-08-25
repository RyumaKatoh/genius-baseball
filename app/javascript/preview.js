document.addEventListener('turbo:load', function(){
  // 新規投稿・編集ページのフォームを取得
  const postForm = document.getElementById('new_practice');
  
  // プレビューを表示するためのスペースを取得
  const previewList = document.getElementById('previews');

  // 新規投稿・編集ページのフォームがないならここで終了。「!」は論理否定演算子。
  if (!postForm) return null;

  // input要素を取得
  const fileField = document.querySelector('input[type="file"][name="practice[video]"]');
  // input要素で値の変化が起きた際に呼び出される関数
  fileField.addEventListener('change', function(e){
    
    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);
    console.log(blob);

    // 画像を表示するためのdiv要素を生成
    const previewWrapper = document.createElement('div');
    previewWrapper.setAttribute('class', 'preview');
    previewWrapper.style.display = 'flex'; // フレックスコンテナとして設定
    previewWrapper.style.justifyContent = 'center'; // 横方向に中央寄せ
    previewWrapper.style.alignItems = 'center'; // 縦方向に中央寄せ

    // 表示する画像を生成
    const previewVideo = document.createElement('video');
    previewVideo.setAttribute('class', 'preview-video');
    previewVideo.setAttribute('src', blob);
    previewVideo.setAttribute('width', '50%'); // 幅を300ピクセルに指定（適宜調整）
  
    // 生成したHTMLの要素をブラウザに表示させる
    previewWrapper.appendChild(previewVideo);
    previewList.appendChild(previewWrapper);
  });
});