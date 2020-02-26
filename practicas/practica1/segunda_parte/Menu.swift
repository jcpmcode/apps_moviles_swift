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
        var str = ""
        
        repeat{
            print("Por favor selecciona alguna de las siguientes ingresando el numero correspondiente:")
            print("\ta. Generar RFC para persona fisica")
            print("\tb. Generar RFC para persona moral")
            print("\tc. Salir de la aplicación")
            opcionSeleccionada = e.obtieneInput()
            
            switch opcionSeleccionada {
            case "a":
                let (apellidoPaterno, apellidoMaterno, nombres, año, mes, día) = personafisica.leerDatosPersonaFisica()
                let (clave, fecha, claveHomonimia, digitoVerificador) = personafisica.generaRFCPersonaFisica(apellidoPaterno: apellidoPaterno, apellidoMaterno: apellidoMaterno, nombres: nombres, año: año, mes: mes, día: día)
                
                print ("RFC Asignado: " + clave + "-" + fecha + "-" + claveHomonimia + "-" + digitoVerificador)
                print ("Presiona cualquier tecla para volver al menu principal...")
                str = e.obtieneInput()
            case "b":
                let (razonSocial, año, mes, día) = personamoral.leerDatosPersonaMoral()
                let (clave, fecha, claveHomonimia, digitoVerificador) = personamoral.generaRFCPersonaMoral(razonSocial: razonSocial, año: año, mes: mes, día: día)
                print(razonSocial)
                //RFC Asignado: ABCD-123456-DE-7
                print ("RFC Asignado: " + clave + "-" + fecha + "-" + claveHomonimia + "-" + digitoVerificador)
                print ("Presiona cualquier tecla para volver al menu principal...")
                str = e.obtieneInput()
            case "c":
                print("Adios!")
            default:
                print("ERROR: Por favor selecciona una opción válida")
            }
            str = ""
        } while (opcionSeleccionada != "c")
    }
}
