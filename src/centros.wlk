import vendedores.*
import ciudades.*
import certificaciones.*

class CentroDeDistribucion {
var property ciudadOrigen 
const property vendedores = []

	method agregar(vendedor) {
		if (not vendedores.contains(vendedor)) {
			vendedores.add(vendedor)
		} else {
			self.error("El vendedor ya está contratado")
		}
	}
	method vendedorEstrella() {
		return vendedores.max{v => v.cantPuntos()}
	}
	method puedeCubrir(ciudad) {
		return vendedores.any{v => v.puedeTrabajarEn(ciudad)}
	}
	method vendedoresGenericos() {
		return vendedores.filter{v => v.esGenerico()}.asList()
	}
	method esRobusto() {
		return vendedores.filter{v => v.esFirme()}.size() >= 3
	}
	method agregarCertificacion(certificacion) {
		vendedores.forEach{v => v.certificaciones().add(certificacion)}
	}
	method esCandidato() {
		return vendedores.any{v => v.esVersatil() and v.tieneAfinidad(self)}
	}	
}