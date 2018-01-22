 
function muestra(){
	document.getElementById('listaHoras').visible = false;
		

}

function muestra_oculta(id){
	if (document.getElementById){ 
	var el = document.getElementById(id); 
	//el.style.display = (el.style.display == 'none') ? 'block'; 
	el.style.display = (el.style.display == 'none') ? 'block' : 'none'; 
	
	
	var val1 = document.getElementById('empleado').value;
	var val2 = document.getElementById('datepicker').value;
	
	return val1;
	}
}





function publicaFecha(campo){ 
            var fecha2 = campo.value
            var val1 = document.getElementById('n1').value;
            
          
            

            document.getElementById("textLapis").innerHTML = valLapis  * 2.5;
        }
        function compruebaRotu(){
            var valRotu = document.f1.nRotu.value

            document.getElementById("textRotu").innerHTML = valRotu  * 3.2;
        }
        function compruebaLibr(){
            var valLibr = document.f1.nLibr.value

            document.getElementById("textLibr").innerHTML = valLibr  * 5.4;
        }

function validarEntero(valor){
    //intento convertir a entero.
    //si era un entero no le afecta, si no lo era lo intenta convertir
    valor = parseInt(valor)

    //Compruebo si es un valor numérico
    if (isNaN(valor)) {
        //entonces (no es numero) devuelvo el valor cadena vacia
        return ""
    }else{
        //En caso contrario (Si era un número) devuelvo el valor
        return valor
    }
}

function CalcularValores() {
    var valLibr = parseInt(document.f1.nLibr.value) * 2.5;
    var valRotu = parseInt(document.f1.nRotu.value) * 3.2;
    var valLapis = parseInt(document.f1.nLapis.value) * 5.4;
    document.getElementById('mensaje').innerHTML = "Valor total da compra: " + (valLapis + valRotu + valLibr);
}

function BorrarValores() {

    document.getElementById('textLapis').innerHTML = "";
    document.getElementById('nLapis').value = 0;
    document.getElementById('textRotu').innerHTML = "";
    document.getElementById('nRotu').value = 0;
    document.getElementById('textLibr').innerHTML = "";
    document.getElementById('nLibr').value = 0;
    document.getElementById('mensaje').innerHTML = "";

}