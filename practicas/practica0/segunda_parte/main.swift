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
    info.imprimeDescripcion()
    menu.imprimeMenu()
}
