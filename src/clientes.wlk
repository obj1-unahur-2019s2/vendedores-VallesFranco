class Cliente {
	method puedeSerAtendido(vendedor) 
}

class ClienteInseguro inherits Cliente {
	override method puedeSerAtendido(vendedor) {
		return vendedor.esVersatil() and vendedor.esFirme()
	}
}

class ClienteDetallista inherits Cliente {
	override method puedeSerAtendido(vendedor) {
		return vendedor.certificaciones().filter{c => c.esDeProductos()}.size() >= 3
	}
}

class ClienteHumanista inherits Cliente {
	override method puedeSerAtendido(vendedor) {
		return vendedor.esPersonaFija()
	}
}