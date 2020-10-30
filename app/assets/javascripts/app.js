$(function() {
  $('#back a').on('click',function(event){  //#back内の<a>タグがクリックされたときの処理
    $('body, html').animate({　　　　　　　　//アニメーション効果を設定するjQueryの関数
      scrollTop:0                          //scrollTop:0 => 最上部に移動
    }, 800);　　　　　　　　　　　　　　　　　//800ミリ秒間（0.8秒間）かけてページの最上部まで移動する
    event.preventDefault();               //aタグの機能を無効にするメソッド
  });
});


$(function() {
  $('.menu-trigger').on('click', function(event) {  //menu-triggerクリック時に行われる処理
    $(this).toggleClass('active');　　　　　　　　　 //該当のclass属性(今回はactive)がある場合にはclassが削除され、ない場合にはclassが追加される
    $('#sp-menu').fadeToggle();                    //.fadeToggle(): 要素のフェードイン・フェードアウトを切り替えるメソッド
    event.preventDefault();
  });
});


$(function(){
    // inputのidから情報の取得
    $('#service_image').on('change', function (e) {
// ここから既存の画像のurlの取得
    var reader = new FileReader();
    reader.onload = function (e) {
        $(".image").attr('src', e.target.result);
    }
// ここまで
    reader.readAsDataURL(e.target.files[0]); //取得したurlにアップロード画像のurlを挿入
});
});


$(function(){
    $('#user_image').on('change', function (e) {
    var reader = new FileReader();
    reader.onload = function (e) {
        $(".image").attr('src', e.target.result);
    }
    reader.readAsDataURL(e.target.files[0]);
});
});
