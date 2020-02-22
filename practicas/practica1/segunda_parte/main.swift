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

let (argc, argumentos) = (CommandLine.argc, CommandLine.arguments)

if (argc > 1) {
    info.imprimeDescripcion()
    info.imprimeUso()
}
else {
    print (personaMoral.quitarAbreviaturasRazonSocial(RazonSocial: "S. en N.C., S. En C hola como estas S. de R.L"))
//    info.imprimeDescripcion()
//    menu.imprimeMenu()
}

// Algoritmo para tomar digitos de la fecha:
