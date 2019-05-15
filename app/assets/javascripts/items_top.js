//「idがtab-contentsである要素内からクラスがtabであり、id属性がtab1でない要素」
//を、「.hide()」メソッドにより隠す↓↓↓
$('#tab-contents .tab[id != "tab1"]').hide();

// タブメニューがクリックされたら、function以降のイベントを実行する
$('#tab-menu a').on('click', function() {
// 一度すべてのコンテンツを非表示にする
  $("#tab-contents .tab").hide();
// classに「active」が設定されているとタブが白くなる設定をしているので、
// 現在設定されているactiveクラスを削除
  $("#tab-menu .active").removeClass("active");
// 選択されたタブに「active」クラスを追加
  $(this).addClass("active");
// href属性で指定されているidに紐づく要素を表示する
  $($(this).attr("href")).show();
  return false;
});