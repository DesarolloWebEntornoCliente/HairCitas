function apertura() {
		$('#LoadPage').load('manipularEmpleado.jsp', function(data) {

			$(this).html(data);
		});
	};
	
	
