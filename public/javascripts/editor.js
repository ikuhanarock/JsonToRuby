
// $(function() {
//   $('#bodyeditor').keyup(function() {  // #bodyeditor内でkeyが押されたら、
//      var src = $(this).val();         // #bodyeditor内の入力内容を取得して、(thisの説明はドットインストール参照だ!!)
//      $('#bodyresult').html(src);      // #bodyresultの中に反映！
//   });
// });

$(function(){//tabでインデント
  $('textarea').keydown(function(e){
    if(e.keyCode == 9){ //押したキーがtab(codeが9)だったら
      e.preventDefault();//元の動きをキャンセルし、
      var elem = e.target;
      var val = elem.value;
      var pos = elem.selectionStart;
      elem.value = val.substr(0, pos) + '  ' + val.substr(pos, val.length);
        //2スペース右へ
      elem.setSelectionRange(pos + 2, pos + 2);
        //カーソル位置も(無選択でも選択ありでも)右2ますへ
    }
  })
});

//keyconfig
$(function(){
  $(window).keydown(function(e){
    if(event.ctrlKey){
      switch(e.keyCode){
        case 68: //ctl + d => 削除
          if(confirm('タイトル/ボディを全て削除しますか?')){
              $('#editor').val('');
              $('#result').html('');
          }
          break;
        case 13://ctrl+enter => textarea移動
          if(document.activeElement.id == "execute"){
            $('#editor').focus();
          }else if(document.activeElement.id == "editor"){
            $('#execute').focus();
          }
          return false;
          break;
      };
    };    
  });
});
