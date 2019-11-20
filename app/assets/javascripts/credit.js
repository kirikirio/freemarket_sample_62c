$(document).on('turbolinks:load', function() {
  var form = $("#card_form");                               // カード登録フォームに付与したidでフォームを指定
  Payjp.setPublicKey('pk_test_b2b0be3df833644010a9ab94');   // pay.jpから提供されているテスト公開キー
  
  
  $(document).on("click", "#token_submit", function(e) {    // sumbitボタンを押したらイベント発火
    e.preventDefault();
    form.find("input[type=submit]").prop("disabled", true); // sumbitボタンの2度押しをしない設定？

      //カード情報生成
      const card = {
        number: parseInt($("#card_number").val()),          // parseIntなんか入力した値（文字列）を整数に変換して数値として取得してくれるメソッド？
        cvc: parseInt($("#card_cvc").val()),
        exp_month: parseInt($("#exp_month").val()),
        exp_year: parseInt($("#exp_year").val())
        };        //↑入力されたデータの取得、pay.jpに送るデータ


      //トークン生成
      Payjp.createToken(card, function(status, response) {
        if (stauts == 200) {                      // 出力（本来はサーバへ送信）:公式の記載がこうなってる。なんで200かがわからない…
          $("#card_number").removeAttr("name");
          $("#card_cvc").removeAttr("name");
          $("#exp_month").removeAttr("name");
          $("#exp_year").removeAttr("name");     //↑入力されたデータをこのアプリに保存しないようにフォームを空にする。
  
          var token = response.id;
          $("#card_form").append($('<input type="hidden" name="payjp_token" class="payjp-token" />').val(token));   // 通信が成功しstatusが200になった時typeがhiddenとなっているinput要素が追加される
          $("#card_form").get(0).submit();       //e.preventDefault();によって停止させていたsubmitを実行させる
          alert("登録が完了しました。")
        }
        else {
          alert("カード情報が正しくありません。")
          form.find('button').prop('disabled', false);
        }
      });
    });
  });