import ciudades.*
import certificaciones.*

class Vendedor {
var property certificaciones = #{}
var property cantPuntos = self.sumarPuntos()

	method puedeTrabajarEn(ciudad) 
	method esVersatil() {
		return certificaciones.size() >= 3 and
		certificaciones.any{c => c.esDeProductos()} and 
		certificaciones.any{c => not c.esDeProductos()}
	}
	method esFirme() {
		return certificaciones.sum{c => c.puntos()} >= 30
	}
	method esInfluyente()
	method sumarPuntos() {
		return certificaciones.sum{c => c.puntos()}
	}
	method esGenerico() {
		return certificaciones.any{c => not c.esDeProductos()}
	}
	method tieneAfinidad(centro)
	 
}

class VendedorFijo inherits Vendedor {
var property ciudadNatal = ""
var property esPersonaFija = true
	
	override method puedeTrabajarEn(ciudad) {
		return ciudadNatal == ciudad
	}
	override method esInfluyente() {
		return false
	}
	override method tieneAfinidad(centro) {
		return ciudadNatal == centro.ciudadOrigen()
	}
}

class Viajante inherits Vendedor {
const property provinciasHabilitadas = #{}
var property esPersonaFija = true

	override method puedeTrabajarEn(ciudad) {
		return provinciasHabilitadas.contains(ciudad.provincia())
	}
	override method esInfluyente() {
		return provinciasHabilitadas.sum{p => p.poblacionTotal()} >= 10000000 
	}
	override method tieneAfinidad(centro) {
		return provinciasHabilitadas.contains(centro.ciudadOrigen().provincia())
	}	
}

class ComercioCorresponsal inherits Vendedor {
const property sucursales = #{}
var property esPersonaFija = false

	override method puedeTrabajarEn(ciudad) {
		return sucursales.contains(ciudad)
	}
	override method esInfluyente() {
		return sucursales.size() >= 5 or
		sucursales.map{c => c.provincia()}.asSet().size() >= 3
	}
	override method tieneAfinidad(centro) {
		return sucursales.any{c => not centro.puedeCubrir(c)}
	}	
}