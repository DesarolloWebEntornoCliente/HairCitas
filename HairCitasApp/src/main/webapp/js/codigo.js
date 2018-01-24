function apertura() {
	alert("ui u iu ui iu ui uiu i");
		$('#LoadPage').load('manipularEmpleado.jsp', function(data) {

			$(this).html(data);
		});
	};
	
	
