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
    /* Lo mismo que con pepon.
    method validarVolar(distancia){
        if(!self.puedeVolar(distancua)){
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

    /* NO hace falta hacerlo en las aves en este caso. Solo vuelvan cuando se lo indica en entrenador. El error es de del etrenador
    method energiaGastadaAlVolar(distancia){
        return 20 + 2*distancia
    }

    method validarVolar(distancia){
        if(!self.puedeVolar(distancia)){
            self.error("No se puede volar " + self.energiaGastadaAlVolar(distancia) + " con " + energia + " de energia")
        }
    }*/
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
    const aves = []

    method entrenar(_ave){
        aves.add(_ave)
    }

    method movilizar(distancia){
        self.validarMovilizar(distancia)
        aves.forEach({ ave=> ave.volar(distancia)})
    }

    method validarMovilizar(distancia){
        if( aves.any( { ave => !ave.puedeVolar(distancia)})){
            self.error("Algun ave no puede volar " + distancia + " distancia")
        }
    }

}