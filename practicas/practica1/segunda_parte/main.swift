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

let (argc, argumentos) = (CommandLine.argc, CommandLine.arguments)

if (argc > 1) {
    info.imprimeDescripcion()
    info.imprimeUso()
}
else {
    info.imprimeDescripcion()
    menu.imprimeMenu()
}


// Validaciones persona moral

// Primero quitar todas las palabras de la razon social que no sirvan
// Despues contar las palabras

// if (contadorDePalabras > 0) {
//    if (contadorDePalabras >= 3) {

//    } else {
//        // Regla 6
//        if (contadorDePalabras == 2) {

//        }
//        else {
//            // Regla 7
//            if (contadorDeLetras < 3){
//                // Regla 8

//            }
//        }
//    }
// }
// else {
//    print("Tienes que ingresar al menos una palabra")
// }



// Algoritmo para tomar digitos de la fecha:

// Diccionarios Personas fisicas:
// Tabla VI

// Diccionarios personas morales:
// Tabla V