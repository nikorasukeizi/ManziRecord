$(window).on('scroll', function() {
    scrollHeight = $(document).height();
    scrollPosition = $(window).height() + $(window).scrollTop();
    if ( (scrollHeight - scrollPosition) / scrollHeight <= 0.05) {
          $('.jscroll').jscroll({
            contentSelector: '.item_list',
            nextSelector: 'span.next:last a'
          });
         // get_rank();
    }
});


// $('.jscroll').jscroll({... の代わりに入れればいけそう
function get_rank() {
	$.ajax({
		// url: 'ページ情報を取得するメソッド',
		dataType: 'json',
		type: 'POST',
		data:{
			// 'page': ページの値,
		}
	})
	// Ajaxリクエストが成功した時発動
	.done( (data) => {
		// HTML生成処理
		console.log("成功");
		console.log(data);
	})
	// Ajaxリクエストが失敗した時発動
	.fail( (data) => {
		// 基本は何もなくてよい
		console.log("失敗");
		console.log(data);
	})
}
