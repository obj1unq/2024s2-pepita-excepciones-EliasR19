object pepita {
	var energia = 100
	
	method comer(comida) {
		energia = energia + comida.energiaQueAporta()
	}
	
	method volar(distancia) {
        //self.validarVolar(distancia)
		energia = energia - self.energiaGastadaAlVolar(distancia)
	}
		
	method energia() {
		return energia
	}

    method energiaGastadaAlVolar(distancia){
        return  10 + distancia
    }
	/* El enunciado no lo pide
    method validarVolar(distancia){
        if(!self.puedeVolar(distancia)){
            self.error("No se puede volar " + self.energiaGastadaAlVolar(distancia) + " con " + energia + " de energia")
        }
    }
	*/
    
    method puedeVolar(distancia){
        return self.energiaGastadaAlVolar(distancia) < energia
    }
}

object alpiste {
	method energiaQueAporta() {
		return 20
	}
}

object manzana {
	var madurez = 1
	const base = 5
	
	method madurez() {
		return madurez
	}
	
	method madurez(_madurez) {
		madurez = _madurez
	}
	
	method madurar() {
		self.madurez(madurez + 1)
	}
	
	method energiaQueAporta() {
		return base * madurez
	}
	
}

object pepon {
	var energia = 30
	
	method energia() {
		return energia
	}
		
	method comer(comida) {
		energia = energia + comida.energiaQueAporta() / 2
	}
		
	method volar(distancia) {
        //self.validarVolar(distancia)
		energia = energia - self.energiaGastadaAlVolar(distancia)
	}

    method energiaGastadaAlVolar(distancia){
        return 20 + 2*distancia
    }

    // La consigna dice que un ave no puede volar si no le alcanza la anergia
    
/*
    method validarVolar(distancia){
        if(!self.puedeVolar(distancia)){
            self.error("No se puede volar " + self.energiaGastadaAlVolar(distancia) + " con " + energia + " de energia")
        }
    }
*/
    method puedeVolar(distancia){
        return self.energiaGastadaAlVolar(distancia) < energia
    }
	
}

object roque {
	var ave = pepita
	var cenas = 0;
	
	method ave(_ave) {
		ave = _ave
		cenas = 0
	}
	
	method alimentar(alimento) {
		ave.comer(alimento)
		cenas = cenas + 1
	}
    
}

object milena{
    const aves = #{} //

    method entrenar(ave){
        aves.add(ave)
    }

    method movilizar(distancia){
        self.validarMovilizar(distancia)
        aves.forEach({ ave=> ave.volar(distancia)})
    }

    method validarMovilizar(distancia){
        if(!self.puedeMovilizar(distancia)){
            self.error("Algun ave no puede volar " + distancia + " distancia")
        }0
    }
	method puedeMovilizar(distancia){
		return aves.all( { ave => ave.puedeVolar(distancia)})
	}

	// not all === any

}

/* validación: si la condación da verdadero falla.
*/

// forEach solo para orden, usar con cabeza(poco)
// no devuelve nada
// toda la coleccion hace X orden.