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

    func reemplazarElementosString (cadena: String, listaDePalabrasAReemplazar: [String], StringDeReemplazo: String) -> String {
        var resultado = cadena
        var componentes : [String]
        var ocurrencias = 0
        
        for palabraInconveniente in listaDePalabrasAQuitar {
            // hay que iterar el numero de veces que encuentra las palabras
            componentes = cadena.components(separatedBy: palabraInconveniente)
            ocurrencias = componentes.count - 1
            for _ in 0..<ocurrencias {
            resultado = resultado.replacingOccurrences(of: palabraInconveniente, with: StringDeReemplazo)
            }
        }
        return resultado
    }

    func quitarStringsVacios (cadena: String) -> [String] {
        var cadenaEnArray = cadena.components(separatedBy: " ")

        let resultado = cadena.filter {!($0 == "" || $0 == " ")}

        return resultado
    }
    
    func obtenFecha (año: Int, mes: Int, día: Int) -> String {
        let calendar = Calendar.current
        let formatter = DateFormatter()
        let dateComponents = DateComponents(calendar: calendar, year: año, month: mes, day: día)
        let fecha = calendar.date(from: dateComponents)

        formatter.dateFormat = "yyMMdd"
        formatter.timeZone = TimeZone.current
        let date = formatter.string(from: fecha!)

        return date
    }

    func isInt(string: String) -> Bool {
        return Int(string) != nil
    }

    func quitarAcentosClave (clave: String) -> String {
        var resultado = clave

        for (letraConAcento, sustituto) in equivalenciasAcentos {
            resultado = resultado.replacingOccurrences(of:letraConAcento, with: sustituto)
        }
            
        return resultado
    }

    func preparaStringParaValidaciones (cadena: String) -> String {
        var resultado = " "
        resultado += cadena
        resultado += " "
        resultado = resultado.uppercased()
        
        return resultado
    }

    func obtenerClaveHomonimia (entrada: String) -> String {
        var resultado = ""

        return resultado
    }

}
