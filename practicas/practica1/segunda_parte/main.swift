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
    let str = "S. en C., S. En C hola como estas S. de R.L. sociedad xs S en C."
//    let str = "s en c s en c s en c s en c s en c"
    c = personaMoral.preparaStringParaValidaciones(RazonSocial: str)
    a = personaMoral.quitarElementosString(cadena: c, listaDePalabrasAQuitar: d.caracteresNoPermitidos, StringDeReemplazo: "")
    b = personaMoral.quitarElementosString(cadena: a, listaDePalabrasAQuitar: d.tablaPalabrasNoUtilizadasRFCMoralesSinPuntos, StringDeReemplazo: " ")
    let razonSocial = b.components(separatedBy: " ")
    print (razonSocial)
    
//    if (razonSocial[0] == "") {
//        razonSocial.remove(at: 0)
//    }
    print (a)
    print (b)
//    info.imprimeDescripcion()
//    menu.imprimeMenu()
}

// Algoritmo para tomar digitos de la fecha:
