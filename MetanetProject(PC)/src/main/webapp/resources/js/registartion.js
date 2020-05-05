var action = '';
var url = '';
var type = '';
var bno = 0;

$(document).ready(function(){
	$("button[name='detail']").click(function(){
		action='detail';
		type = 'PUT';
		bno = this.value;
		var row = $(this).parernt().parent().parent();
		var tr = row.children();
		var userName = tr.eq(2).text();
		var contents = tr.eq(1).text();
		$("#userName").val(userName);
		$("userId").val(contents);
		$("#myModal").modal();
			
	});
	
});