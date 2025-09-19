object tito {
    var cantidad = 0
    var bebida = cianuro
    method peso() = 70
    method inerciaBase() = 490
    method consumir(unaCantidad,unaBebida) {
        bebida = unaBebida
        cantidad = unaCantidad
    }
    method bebida() = bebida

    method velocidad() {
        return bebida.rendimiento(cantidad)
        * self.inerciaBase() / self.peso()
    }
}

object wisky {
    method rendimiento(cantidad) = 0.9 ** cantidad
}
object cianuro {
    method rendimiento(cantidad) = 0
}

object terere {
    method rendimiento(cantidad) {
        return 1.max(cantidad * 0.1)
        //tambien (cantidad * 0.1).max(1)
    }
}

object licuado {
    const nutrientes=[10]
  method rendimiento(cantidad){
    if (cantidad/1000 >0){
        return nutrientes.sum()
    }
    else{
        return 0
    }
  }
  method agregarNutrientes(num){
    nutrientes.add(num)
  }
}

object aguaSaborizada {
    var bebidaMezclada=wisky
  method  rendimiento(cantidad) {
    return ((cantidad*3)/4)+bebidaMezclada.rendimiento(cantidad/4)
  } 
  method cambiarMezcla(bebida) {
    bebidaMezclada=bebida
  }
}

object coctel {
  const bebidasUnidas=[]
  method rendimiento(cantidad){
    var rendimientoTotal=1
    bebidasUnidas.forEach({bebida => 
    rendimientoTotal*=bebida.rendimiento(cantidad)
    })
    return rendimientoTotal
  }
  method agregarBebida(bebida) {
    bebidasUnidas.add(bebida)
  }
}