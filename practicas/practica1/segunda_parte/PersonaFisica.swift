//
//  PersonasFisicas.swift
//  segunda_parte
//
//  Created by jpaniagua on 2/19/20.
//  Copyright © 2020 jpaniagua. All rights reserved.
//

import Foundation

let entradaYSalida = EntradaYSalida()

// MARK: - Personas fisicas
//  3 letras, 1 espacio y 6 digitos. 3 digitos adicionales para la homoclave (2 letras y 1 numero)
class PersonaFisica {
    
    func leerDatosPersonaFisica() {
        var apellidoPaterno = ""
        var apellidoMaterno = ""
        var nombres = ""
        var Año = ""
        var Mes = ""
        var Día = ""

        print("Ingresa los datos de la persona fisica a registrar: ")
        repeat {            
            print("\tApellido paterno: ")
            apellidoPaterno = entradaYSalida.obtieneInput()
        } while apellidoPaterno.isEmpty
        repeat {
            print("\tApellido Materno: ")
            apellidoMaterno = entradaYSalida.obtieneInput()
        } while apellidoMaterno.isEmpty
        repeat {
            print("\tNombre(s): ")
            nombres = entradaYSalida.obtieneInput()
        } while nombres.isEmpty 
        
        // Validar que la fecha de nacimiento cumpla con el requisito de que la persona tenga los 18 años cumplidos
        print("Ingresa la fecha de nacimiento:")
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
        
        // devolver el RFC

        print ("Presiona cualquier tecla para volver al menu principal...")
    }

    func generaRFCPersonaFisica() {

    }
}




// Validaciones persona fisica
// Al final de generar la clave, si la clave conforma alguna palabra inconveniente hay que reemplazar la ultima letra por una X -> Regla 9


// Diccionarios Personas fisicas:
// Tabla VI
