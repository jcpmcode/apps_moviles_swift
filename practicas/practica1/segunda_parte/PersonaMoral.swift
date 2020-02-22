//
//  PersonasMorales.swift
//  segunda_parte
//
//  Created by jpaniagua on 2/19/20.
//  Copyright © 2020 jpaniagua. All rights reserved.
//

import Foundation

let entradaysalida = EntradaYSalida()
let diccionarios = Diccionarios()

// MARK: - Personas morales
// 4 letras y 6 digitos 3 digitos adicionales para la homoclave (2 letras y 1 numero)
class PersonaMoral {
    
    func leerDatosPersonaMoral() {
        var razonSocial = ""
        var Año = ""
        var Mes = ""
        var Día = ""

        print("Ingresa los datos de la persona moral a registrar:")
        repeat {    
            print("\tIngresa la razon social de la empresa: ")
            razonSocial = entradaYSalida.obtieneInput()
        } while razonSocial.isEmpty
        print("Ingresa la fecha de creacion de la empresa:")
        repeat {    
            print("\tAño: ")
            Año = entradaYSalida.obtieneInput()
        } while Año.isEmpty
        repeat {    
            print("\tMes: ")
            Mes = entradaYSalida.obtieneInput()
        } while Mes.isEmpty
        repeat {    
            print("\tDía: ")
            Día = entradaYSalida.obtieneInput()
        } while Día.isEmpty
        // Validar que la fecha sea menor o igual a la fecha actual
    }

    func quitarAbreviaturasRazonSocial (RazonSocial: String) -> String {
        var resultado = RazonSocial.uppercased()

        for (palabraInconveniente, sustituto) in diccionarios.tablaPalabrasNoUtilizadasRFCMorales {
            if RazonSocial.uppercased() == palabraInconveniente {
                resultado = sustituto
            }
        }
        return resultado
    }
    
    func generaRFCPersonaMoral() {

    }
}

// Validaciones persona moral

// Primero quitar todas las palabras de la razon social que no sirvan -> Reglas 5, 9 y 11
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


// Diccionarios personas morales:
// Tabla V
