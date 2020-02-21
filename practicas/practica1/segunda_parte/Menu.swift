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
        var opcionSeleccionada: Int = 0
        
        repeat{
            print("Por favor selecciona alguna de las siguientes ingresando el numero correspondiente:")
            print("\t1. Generar RFC para persona fisica")
            print("\t2. Generar RFC para persona moral")
            print("\t3. Salir de la aplicación")
            switch opcionSeleccionada {
                case 1:
                    personafisica.leerDatosPersonaFisica()                    
                case 2:
                    personamoral.leerDatosPersonaMoral()
                case 3:
                    print("Adios!")
                default:
                print("ERROR: Por favor selecciona una opción válida")
            }
        }
        while (opcionSeleccionada != 3)
    }
}
