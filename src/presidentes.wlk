class ActoDeGobierno{
	var personas
	var importancia
	var impacto
	constructor(_per, _importancia, _impacto) {
		personas = _per
		importancia = _importancia
		impacto = _impacto
	}
	method importancia(){
		return importancia
	}
	method impacto(){
		return impacto
	}
}

class Inaguraciones inherits ActoDeGobierno{
	var naturalezaObra
	constructor (_Obra){ 
		naturalezaObra = _Obra
	}
	method naturalezaObra(){
		return naturalezaObra
	}
	override method impacto(){
		return personas*self.importancia() + naturalezaObra* personas*super().importancia()
	}
}
class InaguracionVial inherits Inaguraciones{
	
	override method naturalezaObra(){
		return 1.1
	}
}
class InaguracionHabitacionales inherits Inaguraciones{
		override method naturalezaObra(){
		return 1.2
	}
}
class InaguracionSalud inherits Inaguraciones{
		override method naturalezaObra(){
		return 1.5
	}
}

class Discurso inherits ActoDeGobierno{
	var intensidadAplauso
	
	override method impacto(){
		return personas * importancia * intensidadAplauso
	}
}
class Promesas inherits Discurso{
	var seCumplio 
	method seCumplio(){
		return seCumplio
	}
	if (seCumplio() == true){
		impacto = personas * importancia * intensidadAplauso * 2
	}
	else 
		impacto = personas * importancia * intensidadAplauso  * (-1)
}

class Denuncia inherits ActoDeGobierno{
	var denunciante
	override method impacto(){
		return personas * importancia * denunciante
	}
}

class Presidente{
	var actos = []
	var promesas = []
	var fechaDeMuerte
	constructor (_muerte) {
		fechaDeMuerte = _muerte
	}
	method imagen(){
		return actos.sum(acto=> acto.impacto()) + ((2017 - fechaDeMuerte) * actos.sum( x=> x.impacto()))
	}
	method masDeCuatro(){
		return actos.size() > 4
	}
	method cumplirPromesasFalsas(){
		foreach {(promesas.seCumplio == false => promesas.seCumplio = true}}
	}
} 
