import elementos.*

class Plagas {
	var property poblacion
	
	method transmitenEnfermedades(){return self.poblacion() >= 10}
	method atacarA(elemento){
		elemento.recibirAtaqueDe(self)
		poblacion = self.poblacion() + (self.poblacion() * self.aumentoPoblacion())
	}
	method aumentoPoblacion(){return 0.1}
}

class Cucarachas inherits Plagas {
	var property pesoPromedio
	
	method nivelDeDanio(){
		return self.poblacion() / 2
	}
	
	override method transmitenEnfermedades(){
		return super() and pesoPromedio >= 10
	}
	
	override method atacarA(elemento){
		super(elemento)
		pesoPromedio += 2
	}
}

class Mosquitos inherits Plagas {
	method nivelDeDanio(){return self.poblacion()}
	
	override method transmitenEnfermedades(){
		return super() and
		self.poblacion() % 3 == 0
	}
}

class Pulgas inherits Plagas {
	method nivelDeDanio(){
		return self.poblacion() * 2
	}
}

class Garrapatas inherits Plagas {
	method nivelDeDanio(){
		return self.poblacion() * 2
	}
	override method aumentoPoblacion(){
		return 0.2
	}
}
