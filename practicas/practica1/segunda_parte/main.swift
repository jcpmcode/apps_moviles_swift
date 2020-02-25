//
//  main.swift
//  segunda_parte
//
//  Created by jpaniagua on 2/17/20.
//  Copyright © 2020 jpaniagua. All rights reserved.
//

import Foundation

let info = Info()
let menu = Menu()
let es = EntradaYSalida()
let personaMoral = PersonaMoral()
let personaFisica = PersonaFisica()
let d = Diccionarios()

var a = ""
var b = ""
var c = ""

let (argc, argumentos) = (CommandLine.argc, CommandLine.arguments)

if (argc > 1) {
    info.imprimeDescripcion()
    info.imprimeUso()
}
else {
    // info.imprimeDescripcion()
    // menu.imprimeMenu()
    
    // let str = "S. en C. S. En C.  S. En C.  S. En C.  S. En C. h hola como estas S. de R.L. sociedad xs S. en C.  LA  Paty el  Chucho "
    // let entradaLimpia = personaMoral.quitarStringsVacios(cadena: s)
    // let numerosRomanosAArabigos = personaMoral.convertirNumerosRomanosArabigos(cadenaEnArray: s)
    // let numerosAPalabras = personaMoral.convertirNumerosAPalabras(cadenaEnArray: s)     
    // let cadenaPreparada = personaMoral.preparaStringParaValidaciones(cadena: s)
    // let cadenaSinCaracteresNoPermitidos = personaMoral.reemplazarElementosString(cadena: s, listaDePalabrasAReemplazar: d.caracteresNoPermitidos, StringDeReemplazo: "")
    // let cadenaSinPalabrasNoPermitidas = personaMoral.reemplazarElementosString(cadena: s, listaDePalabrasAReemplazar: d.tablaPalabrasNoUtilizadasRFCMorales, StringDeReemplazo: " ")
    // let cadenaSinPuntosYComas = personaMoral.reemplazarElementosString(cadena: s, listaDePalabrasAReemplazar: d.puntosYComas, StringDeReemplazo: "")
    // let cadenaFiltrada = personaMoral.quitarStringsVacios(cadena: s)
    // let clave = personaMoral.obtenClavePersonaMoral(razonSocial: )
    // let fechaFormateada = obtenFecha (año: año, mes: mes, día: día)
    // let rfc = clave + fechaFormateada
}
