import plagas.*

class Hogar {
	var property nivelDeMugre
	var property confort
	
	method esBueno(){
		return nivelDeMugre <= confort
	}
	
	method recibirAtaqueDe(plaga){
		nivelDeMugre += plaga.nivelDeDanio()
	}
}

class Huerta {
	var property capacidadDeProduccion
	var property nivelProduccion
	method esBueno(){
		return capacidadDeProduccion > nivelProduccion
	}
	method recibirAtaqueDe(elemento){
		capacidadDeProduccion -= elemento.nivelDeDanio() * 0.1
		if(elemento.transmitenEnfermedades()){capacidadDeProduccion -= 10}
	}
}

class Mascota {
	var property nivelDeSalud
	
	method esBueno(){
		return nivelDeSalud > 250
	}
	
	method recibirAtaqueDe(elemento){
		if(elemento.transmitenEnfermedades()){
			nivelDeSalud -= elemento.nivelDeDanio()
		}
	}
}

class Barrio {
	const elementos = []
	
	method agregar(elemento){elementos.add(elemento)}
	method quitar(elemento){elementos.remove(elemento)}
	
	method barrioCopado(){
		return elementos.filter({e => e.esBueno()}).size() > elementos.size()/2
	}
}