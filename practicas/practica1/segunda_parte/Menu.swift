//
//  Menu.swift
//  segunda_parte
//
//  Created by jpaniagua on 2/19/20.
//  Copyright © 2020 jpaniagua. All rights reserved.
//

import Foundation
import Darwin

let e = EntradaYSalida()
let personafisica = PersonaFisica()
let personamoral = PersonaMoral()

// MARK: - Menu principal
class Menu {
    
    func imprimeMenu() {
        var opcionSeleccionada: String = ""
        repeat{
            print("Por favor selecciona alguna de las siguientes ingresando el numero correspondiente:")
            print("\ta. Generar RFC para persona fisica")
            print("\tb. Generar RFC para persona moral")
            print("\tc. Salir de la aplicación")
            opcionSeleccionada = e.obtieneInput()
            
            switch opcionSeleccionada {
                case "a":
                    personafisica.leerDatosPersonaFisica()                    
                case "b":
                    personamoral.leerDatosPersonaMoral()
                case "c":
                    print("Adios!")
                default:
                print("ERROR: Por favor selecciona una opción válida")
            }
        }
        while (opcionSeleccionada != "c")
    }
}
