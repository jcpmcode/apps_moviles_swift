//
//  PersonasMorales.swift
//  segunda_parte
//
//  Created by jpaniagua on 2/19/20.
//  Copyright © 2020 jpaniagua. All rights reserved.
//

import Foundation

let entradaysalida = EntradaYSalida()

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

    func generaRFCPersonaMoral() {

    }
}
