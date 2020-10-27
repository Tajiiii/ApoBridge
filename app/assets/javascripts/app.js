$(function() {
  $('#back a').on('click',function(event){  //#back内の<a>タグがクリックされたときの処理
    $('body, html').animate({　　　　　　　　//アニメーション効果を設定するjQueryの関数
      scrollTop:0                          //scrollTop:0 => 最上部に移動
    }, 800);　　　　　　　　　　　　　　　　　//800ミリ秒間（0.8秒間）かけてページの最上部まで移動する
    event.preventDefault();               //aタグの機能を無効にするメソッド
  });
});