$(function() {
  // ［実行］ボタンクリックで検索開始
  $('#execute').click(function() {
    $.get('get',
      {
        query: $('#editor').val()
      }
    )
    // 成功した場合
    .done(function(data) {
      // 改行の置き換え
      result = data.replace(/\r?\n/g, '<br>');
      // タブの置き換え
      result = result.replace(/\t/g, '&nbsp;&nbsp;');
      $('#result').html(result);
    })
    // 失敗した場合
    .fail(function() {
      window.alert('正しい結果を得られませんでした。');
    });
  });
});
