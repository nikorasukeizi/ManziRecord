$(function() {
	// 「登録先」クリック時処理
	$('#target_regist').on('click', function() {
		$('.ctrl_area').hide();
		$('.ctrl_area').find(':input').attr('disabled', true);
	}).click();
	// 「登録先以外に送る」クリック時処理
	$('#target_new').on('click', function() {
		$('.ctrl_area').show();
		$('.ctrl_area').find(':input').attr('disabled', false);
	});
});

$(document).ready(function() {
		$("#new_buy_info").validationEngine();
});