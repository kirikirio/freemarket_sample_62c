document.addEventListener(
  "DOMContentLoaded", (e) => {
    Payjp.setPublicKey("公開鍵");
    const btn = document.getElementById('token_submit'); //hamlで記載されているidを取得した時
    btn.addEventListener("click", (e) => {　//formのボタンを押した時にイベント発動
      e.preventDefault();

      //カード情報生成
      const card = {
        number: document.getElementById("card_number").value,
        cvc: document.getElementById("cvc").value,
        exp_month: document.getElementById("month").value,
        exp_year: document.getElementById("year").value
      }; //入力されたデータの取得↑

      //トークン生成
      Payjp.createToken(card, (status, response) => {
        if (status === 200) { //成功した場合
          $("#card_number").removeAttr("name");
          $("#cvc").removeAttr("name");
          $("#month").removeAttr("name");
          $("#year").removeAttr("name"); //カード情報を自分のサーバにpostせず削除します
          $("#card_token").append(
            $('<input type="hidden" name="payjp-token">').val(response.id)
          ); //トークンを送信できるように隠しタグを生成
          document.inputForm.submit();
          alert("登録が完了しました"); //確認用
        } else {
          alert("カード情報が正しくありません。"); //確認用
        }
      });
    });
  },false);