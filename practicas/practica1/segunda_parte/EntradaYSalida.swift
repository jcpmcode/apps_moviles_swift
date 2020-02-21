//
//  EntradaYSalida.swift
//  segunda_parte
//
//  Created by jpaniagua on 2/19/20.
//  Copyright © 2020 jpaniagua. All rights reserved.
//

import Foundation

class EntradaYSalida {

    let diccionarios = Diccionarios()
    
    // MARK: - Leer entrada del usuario
    func obtieneInput() -> String {
        let teclado = FileHandle.standardInput
        let datosTecleados = teclado.availableData
        let datosEnString = String(data: datosTecleados, encoding: .utf8)!

        return datosEnString.trimmingCharacters(in: .newlines)
    }
    
    // MARK: - Validar
    func validaArgumentos() {
        
    }

    func validaPalabrasInconvenientes(expresionAlfabetica: String) -> String{
        var resultado = expresionAlfabetica

        for (palabraInconvenente, sustituto) in diccionarios.tablaPalabrasInconvenientes {
            if expresionAlfabetica == palabraInconvenente {
                resultado = sustituto
            }
        }
        return resultado
    }
}
