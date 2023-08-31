// document.addEventListener("DOMContentLoaded", function() {
//   const postTab = document.getElementById("post-tab");
//   const favoriteTab = document.getElementById("favorite-tab");
//   const postContent = document.getElementById("post-content");
//   const favoriteContent = document.getElementById("favorite-content");

//   postTab.addEventListener("click", function() {
//     postContent.style.display = "block";
//     favoriteContent.style.display = "none";
//   });

//   favoriteTab.addEventListener("click", function() {
//     postContent.style.display = "none";
//     favoriteContent.style.display = "block";
//   });
// });


// // タブの切り替えとturbolinksの無効化
// $(document).on('turbolinks:load', function() {
//   $(function() {
//     $('.tab').click(function(){
//       $('.tab-active').removeClass('tab-active');
//       $(this).addClass('tab-active');
//       $('.box-show').removeClass('box-show');
//       const index = $(this).index();
//       $('.tabbox').eq(index).addClass('box-show');
//     });
//   });
// });


document.addEventListener("DOMContentLoaded", function() {
  const practiceTab = document.getElementById("practice-tab");
  const favoriteTab = document.getElementById("favorite-tab");
  const practiceContent = document.getElementById("practice-content");
  const favoriteContent = document.getElementById("favorite-content");

  // 投稿一覧タブがクリックされた場合の処理
  practiceTab.addEventListener("click", function() {
    practiceTab.classList.add("tab-active");
    favoriteTab.classList.remove("tab-active");
    practiceContent.classList.add("box-show");
    favoriteContent.classList.remove("box-show");
  });

  // お気に入り一覧タブがクリックされた場合の処理
  favoriteTab.addEventListener("click", function() {
    favoriteTab.classList.add("tab-active");
    practiceTab.classList.remove("tab-active");
    favoriteContent.classList.add("box-show");
    practiceContent.classList.remove("box-show");
  });
});